const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
	const { Results } = this.entities;
	const ECPersonalInformation  = await cds.connect.to('TestService');

	this.on('READ', Results, async(req , next)  => {
		// let req = await service.tx(request);
		// let test = await service.tx(request).run(request.query);
		// // if(request.query.SELECT.columns){

		// // }
		// // test.forEach(element => {
		// // 	element.TestField = element.Name + " - " + element.Description;
		// // });
		// return test
		let PerPersonalQuery = SELECT.from(req.query.SELECT.from)
            .limit(req.query.SELECT.limit)
        if (req.query.SELECT.where) {
            PerPersonalQuery.where(req.query.SELECT.where)
        }
        if (req.query.SELECT.orderBy) {
            PerPersonalQuery.orderBy(req.query.SELECT.orderBy)
        }

        let personal = await ECPersonalInformation.tx(req).send({
            query: PerPersonalQuery
        })
        let personals = []
        if (Array.isArray(personal)){
            personals = personal
        }else {personals[0] = personal}

        const getExtensionData = personals.map(async (item) => {
            const data = await SELECT.from(Results).where({ ID: item.ID })
            item.middelName = item.Name + " - " + item.Description
            return item
        })
        const personalsWithExtension = await Promise.all(getExtensionData)
        if (req.query.SELECT.count) {
            if (personalsWithExtension.length < 30) { personalsWithExtension['$count'] = personalsWithExtension.length } else { personalsWithExtension['$count'] = 1_000 }
        }
        return personalsWithExtension
	});
});