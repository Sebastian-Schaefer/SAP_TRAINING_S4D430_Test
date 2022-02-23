@AbapCatalog.sqlViewName: 'ZI01CUSTOMERREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Uebung 07: Composite View'
define view ZI_01_CustomerWithRevenue
  as select from ZI_00_BookingWithCustomer
{
  key CustomerID                       as ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      sum(Amount)                      as TotalAmount,
      CurrencyCode,
      avg(DaysAhead as abap.dec(16,2)) as AverageDaysAhead
}
group by
    CustomerID,
    Name,
    Street,
    Postcode,
    City,
    Country,
    CurrencyCode
having
    sum(Amount) > 25000
