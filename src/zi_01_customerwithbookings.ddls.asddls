@AbapCatalog.sqlViewName: 'ZI01CUSTOMERBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite View: Customer with Bookings'
define view ZI_01_CustomerWithBookings
  as select from ZI_01_Customer
  association [*] to ZI_01_Booking as _Bookings on ZI_01_Customer.ID = _Bookings.CustomerID
{
  key ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      Discount,
      _Bookings
}
