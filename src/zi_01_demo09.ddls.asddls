@AbapCatalog.sqlViewName: 'ZI01DEMO09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 09: Union & Union All'
define view ZI_01_Demo09
  as select from scustom
{
  key id   as ID,
      name as Name,
      city as City
}
where
  city = 'Berlin'
union select from scustom
  inner join      sbook on scustom.id = sbook.customid
{
  key id   as ID,
      name as Name,
      city as City
}
where
     agencynum = '00000087'
  or agencynum = '00000105'
