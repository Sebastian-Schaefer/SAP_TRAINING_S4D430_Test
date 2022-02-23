@AbapCatalog.sqlViewName: 'ZI01DEMO08'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 08: Outer Joins'
define view ZI_01_Demo08
  as select from    spfli as Connection
    left outer join scarr as Carrier on Connection.carrid = Carrier.carrid
{
  key Carrier.carrid      as Carrid,
  key Connection.connid   as Connid,
      Connection.cityfrom as Cityfrom,
      Connection.cityto   as Cityto
}

