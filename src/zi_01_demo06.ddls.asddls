@AbapCatalog.sqlViewName: 'ZI01DEMO06'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 06: Build-In Funktions'
define view ZI_01_Demo06
  as select from sflight
    inner join   spfli on  sflight.carrid = spfli.carrid
                       and sflight.connid = spfli.connid
    
{

  /* Nummerische Funktionen */
  //F1-Hilfe zeigt weitere Nummerische Funktionen
  //Wir arbeiten mit Possitionsparametern und nicht mit Schlüsselwortparametern
  5.0 / 3.0                                       as Fltp1,
  div(5, 3)                                       as Div1,
  mod(5, 3)                                       as Mod1,
  division(5, 3, 2)                               as Division,
  round(price, 1)                                 as Round1,
  round(price, 0)                                 as Round2,
  round(price, -1)                                as Round3,
  //geht nicht:
  //cast(2.647 as abap.dec(16,2)) as Fltp2
  //stattdessen:
  fltp_to_dec(2.647 as abap.dec(16,2))            as Decimal1,

  /* Zeichenkettenfunktionen */
  concat('Hallo', 'Welt')                         as Concat1,
  concat_with_space('Hallo', 'Welt', 1)           as ConcatWithSpace1,
  planetype                                       as Planetype,
  //Feld in dem ersezt wird | was ersetzt wird | womit es ersetzt wird
  replace(replace(planetype, '7', '9'), '4', '5') as Replace1,

  //substring ab welchem Zeichen und wie viele Zeichen
  substring('Hallo Welt', 7, 4)                   as Substring1,
  right('Hallo Welt', 4)                          as Right1,

  length('X  ')                                   as LengthXSS,   // X <Space> <Space> --> 1
  length('  X')                                   as LengthSSX,   // <Space> <Space> X --> 3
  length(' ')                                     as LengthSpace, // --> 0
  //Weil abap die nachfolgenden Leerzeichen verschluckt!

  /* Waehrungs- und Einheitenumrechnung */
  distance                                        as OldDistance,
  distid                                          as OldDistanceUnit,
  unit_conversion(
    quantity => distance,
    source_unit => distid,
    target_unit => cast('MI' as abap.unit),
    error_handling => 'FAIL_ON_ERROR'
  )                                               as NewDistance,
  cast('MI' as abap.unit)                         as NewDistanceUnit,

  price                                           as OldPrice,
  currency                                        as OldCurrency,
  currency_conversion(
    amount => price,
    source_currency => currency,
    round => '',
    target_currency => cast('EUR' as abap.cuky),
    exchange_rate_date => fldate )                 as NewPrice,
  cast('EUR' as abap.cuky)                        as NewCurrency,

  /* Datums- und Zeitfunktionen */
  dats_add_days(fldate, 20, 'FAIL')               as DatsAddDays1
  
}
