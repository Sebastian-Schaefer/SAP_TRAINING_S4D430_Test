@AbapCatalog.sqlViewName: 'ZC01PARTNERREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Uebung 08'
define view ZC_01_PartnerWithRevenue
  as select from ZI_01_CustomerWithRevenue
{
  key ID,
      'C' as Type,
      Name,
      Street,
      Postcode,
      City,
      Country,
      TotalAmount,
      CurrencyCode,
      AverageDaysAhead
}
union select from ZI_ABAP_AgencyWithRevenue
{
  key ID,
      'A'         as Type,
      Name,
      Street,
      Postcode,
      City,
      CountryCode as Country,
      Amount      as TotalAmount,
      CurrencyCode,
      DaysAhead   as AverageDaysAhead
}
