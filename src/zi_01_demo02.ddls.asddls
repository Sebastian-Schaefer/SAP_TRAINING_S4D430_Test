@AbapCatalog.sqlViewName: 'ZI01DEMO02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo02 Projektion Selektion Join'

define view ZI_01_Demo02
  as select from spfli   as Connection
    inner join   sflight as Flight  on  Connection.carrid = Flight.carrid
                                    and Connection.connid = Flight.connid
    inner join   scarr   as Carrier on Carrier.carrid = Connection.carrid
{
  key Carrier.carrid      as CarrierCarrid,
  key Connection.carrid   as ConnectionCarrid,
  key Connection.connid   as ConnectionConnid,
  key Flight.carrid       as FlightCarrid,
  key Flight.connid       as FlightConnid,
  key Flight.fldate       as Fldate,
      Carrier.carrname    as Carrname,
      Connection.cityfrom as Cityfrom,
      Connection.cityto   as Cityto
}
where
  fltype <> 'X' //Charter Fluege ausblenden
