using {Northwind as external} from './external/Northwind.csn';
using {TestService as test} from './external/TestService';
using allorders.db as db_app from '../db/service-definition';

service CatalogService {

    @cds.persistence: {
        table,
        skip : false
    }
    @cds.autoexpose
    entity Results 
        as select from test.Products
        {  
        key ID,
        Name,
        Description,
        @Core.Computed
        virtual Name || Description as testField  : String     
    };


}

@protocol : 'rest'
service CatalogServiceRest{
    entity Results as projection on CatalogService.Results
}