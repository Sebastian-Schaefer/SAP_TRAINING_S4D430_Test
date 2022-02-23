@AbapCatalog.sqlViewName: 'ZI01DEMO05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 05: Arithmetic Expressions and Type Casts'
define view ZI_01_Demo05
  as select from sflight
{
  seatsmax                           as SeatsMaxE,
  seatsmax_b                         as SeatsMaxB,
  seatsmax_f                         as SeatsMaxF,
  seatsmax + seatsmax_b + seatsmax_f as TotalSeatsMax,
  seatsocc                           as SeatsOccupiedE,
  seatsmax - seatsocc                as FreeSeatsE,
  price                              as OldPrice,
  price * 2                          as DoublePrice,
  cast(price as abap.fltp) * 1.1     as NewPrice,
  ( cast(seatsocc as abap.fltp) / cast(seatsmax as abap.fltp) )
    * 100.0                          as OccupancyRate,
  cast(2 as abap.dec(16, 2))         as Decimall,
  'LH '                              as Char1, //hier gibt es dann keine Annotations
  //besser weil die Metadaten aus der Domäne übernommen werden:
  cast('LH' as s_carr_id)            as CarrierId //hat Annotations von Datenelement s_carr_id
  //Ueber F1 Hilfe kann man sehen welche Datentypen zu was gecastet werden können
  //fltp kann zu keinem anderen Datentypen gecastet werden
}
