@AbapCatalog.sqlViewName: 'ZC01BOOKINGCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Booking with Customer'
define view ZC_01_BookingWithCustomer
  as select from ZI_01_CustomerWithBookings
{
//Name der Assoziation.Name des Feldes
  key _Bookings.CarrierID,
  key _Bookings.ConnectionID,
  key _Bookings.FlightDate,
  key _Bookings.BookingID,
      _Bookings.LuggageWeight,
      _Bookings.LuggageWeigthUnit,
      _Bookings.FlightClass,
      _Bookings.Amount,
      _Bookings.CurrencyCode,
      _Bookings.OrderDate,
      _Bookings.CounterID,
      _Bookings.AgencyNumber,
      _Bookings.DaysAhead,
      ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      Discount
}
