@AbapCatalog.sqlViewName: 'ZI01DEMO13'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 13: Path Expressions'
define view ZI_01_Demo13
  as select from ZI_00_Demo12
{
  key carrid,
  key _Carrier.carrname,
  key connid,
      cityfrom,
      cityto,
      _Flights
}
