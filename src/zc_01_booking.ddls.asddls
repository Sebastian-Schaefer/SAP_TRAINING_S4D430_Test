@AbapCatalog.sqlViewName: 'ZC01BOOKING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Booking'
define view ZC_01_BOOKING
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    Deadline : abap.dats
  as select from ZI_01_Booking
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      CustomerID,
      LuggageWeight,
      LuggageWeigthUnit,
      FlightClass,
      Amount,
      CurrencyCode,
      OrderDate,
      CounterID,
      AgencyNumber,
      DaysAhead
}
where
  FlightDate < $parameters.Deadline
