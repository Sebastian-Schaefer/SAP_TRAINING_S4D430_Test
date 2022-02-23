@AbapCatalog.sqlViewName: 'ZI01DEMO03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo03'
define view ZI_01_Demo03
  as select from sflight
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
  //Annotation mit @ Praefix
  //Feld angeben in dem sich die Currency verbindet --> verbindung zwischen Price und Currency
      @Semantics.amount.currencyCode: 'Currency'
      price      as Price,
      currency   as Currency,
      planetype  as Planetype,
      seatsmax   as Seatsmax,
      seatsocc   as Seatsocc,
      @Semantics.amount.currencyCode: 'Currency'
      paymentsum as Paymentsum,
      seatsmax_b as SeatsmaxB,
      seatsocc_b as SeatsoccB,
      seatsmax_f as SeatsmaxF,
      seatsocc_f as SeatsoccF
}
