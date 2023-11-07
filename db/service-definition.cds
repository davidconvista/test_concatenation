namespace allorders.db;

@cds.persistence.table
entity Products {
        ID               : Integer;
        Name : LargeString;
        Description      : LargeString;
}