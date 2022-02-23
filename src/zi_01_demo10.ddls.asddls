@AbapCatalog.sqlViewName: 'ZI01DEMO10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 10: Parameters'
define view ZI_01_Demo10
  with parameters
    P_CarrierID    : s_carr_id,
    P_ConnectionID : s_conn_id
  as select from sflight
{
  key carrid     as CarrierID,
  key connid     as Connid,
  key fldate     as Fldate,
      price      as Price,
      currency   as Currency,
      planetype  as Planetype,
      seatsmax   as Seatsmax,
      seatsocc   as Seatsocc,
      paymentsum as Paymentsum,
      seatsmax_b as SeatsmaxB,
      seatsocc_b as SeatsoccB,
      seatsmax_f as SeatsmaxF,
      seatsocc_f as SeatsoccF
}
where
      carrid = $parameters.P_CarrierID
  and connid = $parameters.P_ConnectionID
