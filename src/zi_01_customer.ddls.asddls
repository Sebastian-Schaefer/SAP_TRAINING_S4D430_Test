@AbapCatalog.sqlViewName: 'ZI01CUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Customer'
define view ZI_01_Customer
  as select from scustom
{
      //key mandt as Mandt,
  key id       as ID,
      name     as Name,
      street   as Street,
      postcode as Postcode,
      city     as City,
      country  as Country,
      discount as Discount,
     cast(discount as abap.fltp) / 100.0 as DiscountFactor,
     
     //Aufgabe 6
     division(cast(discount as abap.dec(16,2)), 3, 2)                               as DiscountDiv,
     concat_with_space(scustom.form, name, 1)           as ConcatWithSpace1
}
