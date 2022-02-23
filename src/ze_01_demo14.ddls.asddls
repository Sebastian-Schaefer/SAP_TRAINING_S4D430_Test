@AbapCatalog.sqlViewAppendName: 'ZE01DEMO14'
@EndUserText.label: 'Demo 14: View Extensions'
//Erweitert die View ZI_01_Demo02
extend view ZI_01_Demo02 with ZE_01_Demo14
  association [*] to sbook as _Bookings on  _Bookings.carrid = Flight.carrid
                                        and _Bookings.connid = Flight.connid
                                        and _Bookings.fldate = Flight.fldate
{
  //base_data_source_name.element_name
  Connection.countryfr as Countryfr,
  Connection.countryto as Countryto,
  _Bookings
}
