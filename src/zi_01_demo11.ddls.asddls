@AbapCatalog.sqlViewName: 'ZI01DEMO11'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 11: Environment System Fields'
define view ZI_01_Demo11
  with parameters
    P_CarrierID    : s_carr_id,
    P_ConnectionID : s_conn_id,
    @Environment.systemField: #SYSTEM_DATE
    P_Deadline     : abap.dats
  as select from ZI_00_Demo10(
                 P_CarrierID: $parameters.P_CarrierID,
                 P_ConnectionID: $parameters.P_ConnectionID )
{
  key CarrierID,
  key Connid,
  key Fldate,
      Price,
      Currency,
      Planetype,
      Seatsmax,
      Seatsocc,
      Paymentsum,
      SeatsmaxB,
      SeatsoccB,
      SeatsmaxF,
      SeatsoccF
}
where
  //  Fldate > $parameters.P_Deadline
  Fldate > $session.system_date
