/* checksum : cde3cafd214200235b7eb152356b7c76 */
@cds.external : true
@cds.persistence.skip : true
entity TestService.FeaturedProduct : TestService.Products {
  @cds.ambiguous : 'missing on condition?'
  Advertisement : Association to one TestService.Advertisements {  };
};

@cds.external : true
@cds.persistence.skip : true
entity TestService.Customer : TestService.Persons {
  TotalExpense : Decimal not null;
};

@cds.external : true
@cds.persistence.skip : true
entity TestService.Employee : TestService.Persons {
  EmployeeID : Integer64 not null;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  HireDate : DateTime not null;
  @odata.Type : 'Edm.Single'
  Salary : Double not null;
};

@cds.external : true
type TestService.Address {
  Street : LargeString;
  City : LargeString;
  State : LargeString;
  ZipCode : LargeString;
  Country : LargeString;
};

@cds.external : true
@Org.OData.Display.V1.Description : 'This is a sample OData service with vocabularies'
service TestService {};

@cds.external : true
@cds.persistence.skip : true
@open : true
@Org.OData.Display.V1.Description : 'All Products available in the online store'
entity TestService.Products {
  key ID : Integer not null;
  @Org.OData.Display.V1.DisplayName : 'Product Name'
  Name : LargeString;
  Description : LargeString;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ReleaseDate : DateTime not null;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  DiscontinuedDate : DateTime;
  Rating : Integer not null;
  Price : Double not null;
  @cds.ambiguous : 'missing on condition?'
  Categories : Association to many TestService.Categories {  };
  @cds.ambiguous : 'missing on condition?'
  Supplier : Association to one TestService.Suppliers {  };
  @cds.ambiguous : 'missing on condition?'
  ProductDetail : Association to one TestService.ProductDetails {  };
};

@cds.external : true
@cds.persistence.skip : true
entity TestService.ProductDetails {
  key ProductID : Integer not null;
  Details : LargeString;
  @cds.ambiguous : 'missing on condition?'
  Product : Association to one TestService.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
@open : true
entity TestService.Categories {
  key ID : Integer not null;
  Name : LargeString;
  @cds.ambiguous : 'missing on condition?'
  Products : Association to many TestService.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
@Org.OData.Publication.V1.PublisherName : 'Microsoft Corp.'
@Org.OData.Publication.V1.PublisherId : 'MSFT'
@Org.OData.Publication.V1.Keywords : 'Inventory, Supplier, Advertisers, Sales, Finance'
@Org.OData.Publication.V1.AttributionUrl : 'http://www.odata.org/'
@Org.OData.Publication.V1.AttributionDescription : 'All rights reserved'
@Org.OData.Publication.V1.![DocumentationUrl ] : 'http://www.odata.org/'
@Org.OData.Publication.V1.TermsOfUseUrl : 'All rights reserved'
@Org.OData.Publication.V1.PrivacyPolicyUrl : 'http://www.odata.org/'
@Org.OData.Publication.V1.LastModified : '4/2/2013'
@Org.OData.Publication.V1.![ImageUrl ] : 'http://www.odata.org/'
entity TestService.Suppliers {
  key ID : Integer not null;
  Name : LargeString;
  Address : TestService.Address;
  @odata.Type : 'Edm.GeographyPoint'
  Location : String;
  Concurrency : Integer not null;
  @cds.ambiguous : 'missing on condition?'
  Products : Association to many TestService.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
@open : true
entity TestService.Persons {
  key ID : Integer not null;
  Name : LargeString;
  @cds.ambiguous : 'missing on condition?'
  PersonDetail : Association to one TestService.PersonDetails {  };
};

@cds.external : true
@cds.persistence.skip : true
entity TestService.PersonDetails {
  key PersonID : Integer not null;
  @odata.Type : 'Edm.Byte'
  Age : Integer not null;
  Gender : Boolean not null;
  Phone : LargeString;
  Address : TestService.Address;
  @Core.MediaType : 'application/octet-stream'
  @odata.Type : 'Edm.Stream'
  Photo : LargeBinary not null;
  @cds.ambiguous : 'missing on condition?'
  Person : Association to one TestService.Persons {  };
};

@cds.external : true
@cds.persistence.skip : true
entity TestService.Advertisements {
  key ID : UUID not null;
  Name : LargeString;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  AirDate : DateTime not null;
  @cds.ambiguous : 'missing on condition?'
  FeaturedProduct : Association to one TestService.FeaturedProduct {  };
  @Core.MediaType : 'application/octet-stream'
  blob : LargeBinary;
};

