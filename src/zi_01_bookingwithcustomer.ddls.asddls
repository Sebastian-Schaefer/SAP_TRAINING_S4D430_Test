@AbapCatalog.sqlViewName: 'ZI01BOOKCUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: BookingWithCustomer'
define view ZI_01_BookingWithCustomer
  as select from ZI_01_Booking as Booking
  inner join ZI_01_Customer as Customer on Customer.ID = Booking.CustomerID
{
    key Booking.CarrierID,
    key Booking.ConnectionID,
    key Booking.FlightDate,
    key Booking.BookingID,
//    key Customer.ID, --> hier nicht sinnvoll, weil eine Buchung keine CustomerID als Key braucht.
    Booking.FlightClass,
    Booking.Amount,
    Booking.NewPrice,
    Booking.CurrencyCode,
    Booking.LuggageWeight,
    Booking.LuggageWeigthUnit,
    Booking.OrderDate,
    Booking.AgencyNumber,
    Booking.CounterID,
    Booking.CustomerID,
    Booking.DaysAhead,
    Customer.Name,
    Customer.Street,
    Customer.Postcode,
    Customer.City,
    Customer.Country,
    Customer.Discount
  }
  
