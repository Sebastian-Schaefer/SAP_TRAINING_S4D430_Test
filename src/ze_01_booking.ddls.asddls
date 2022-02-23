@AbapCatalog.sqlViewAppendName: 'ZE01BOOKING'
@EndUserText.label: 'View Extension: Booking'
extend view ZI_01_Booking with ZE_01_Booking
  association [1..1] to stravelag as _TravelAgency on sbook.agencynum = _TravelAgency.agencynum
{
//base_data_source_name.element_name
  sbook.custtype as CustomerType,
  smoker         as IsSmoker,
  _TravelAgency
}
