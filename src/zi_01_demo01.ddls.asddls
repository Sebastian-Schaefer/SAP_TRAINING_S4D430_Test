@AbapCatalog.sqlViewName: 'ZTI01DEMO01' //Name der SQL-View (max 16 Zeichen)
                                        //Name der SQL-View muss sich von der CDS-View unterscheiden!
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo01 Projections'

/* Projections - Demo S4D430 */
define view ZI_01_Demo01 //Name der CDS-View-Entität (max 30 Zeichen) - wird zur Laufzeit erzeugt und existiert auch nur zur Laufzeit
  as select from scarr
{
      //key mandt as Mandt,
  key carrid   as CarrierID,
      carrname as CarrierName,
      currcode as CurrencyCode,
      url      as Url
}
