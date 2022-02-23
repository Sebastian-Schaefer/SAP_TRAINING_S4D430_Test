@AbapCatalog.sqlViewName: 'ZI01DEMO07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 07: Aggregations'
define view ZI_01_Demo07
  as select from sflight
{
  key carrid                       as CarrierId,
  key connid                       as ConnectionId,
      count(*)                     as NumberOfFlights,
      count(distinct planetype)    as NumberOfPlanetypes,
      sum(seatsocc)                as TotalOccupiedSeatsE,
      sum(paymentsum)              as Totalpaymentsum,
      avg(price as abap.dec(16,2)) as AveragePrice,
      min(seatsocc)                as MinimumOccupiedSeatsE,
      max(seatsocc)                as MaximumOccupiedSeatsE
}
group by
  carrid,
  connid
having
  sum(paymentsum) > 3500000



//define view ZI_13_Demo100
//  as select from spfli
//{
//  //  fltime as FlightTime,
//  avg(case when fltime > 100 then 100 else 0 end)                    as Average1,
//  cast(sum(case when fltime > 100 then 100 else 0 end) as abap.int4) as Sum1,
//  sum(case when fltime > 100 then 1 else 0 end)                        as Count1
//  //  division(Sum1, Count1, 2)                       as Division1
//}
