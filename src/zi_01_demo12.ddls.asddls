@AbapCatalog.sqlViewName: 'ZI01DEMO12'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 12: Associations'
define view ZI_01_Demo12
  as select from spfli as Connection
  association [*] to sflight as _Flights on  Connection.carrid = _Flights.carrid
                                         and Connection.connid = _Flights.connid
  association [1] to scarr   as _Carrier on  _Carrier.carrid = Connection.carrid
{
  key Connection.carrid,
  key Connection.connid,
      Connection.cityfrom,
      Connection.cityto,
      _Flights,
      _Carrier
}
