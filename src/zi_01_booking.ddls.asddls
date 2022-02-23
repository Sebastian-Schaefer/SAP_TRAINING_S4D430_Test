@AbapCatalog.sqlViewName: 'ZI01BOOKING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Booking'

/* S4D430 - Uebung 2 */
define view ZI_01_Booking
  as select from sbook
{
      //key mandt as Mandt,
  key carrid                               as CarrierID,
  key connid                               as ConnectionID,
  key fldate                               as FlightDate,
  key bookid                               as BookingID,
      //      class      as FlightClass,
      //Aufgabe 5:
      @EndUserText.label: 'Flight Class'
      @EndUserText.quickInfo: 'Flight Class'
      case class
          when 'F' then 'First Class'
          when 'Y' then 'Economy Class'
          when 'C' then 'Business Class'
          else ''
      end                                  as FlightClass,
      //      case class
      //          when 'Y' then 'Economy'
      //          when 'C' then 'Business'
      //          when 'F' then 'First'
      //          else ''
      //      end        as FlightClassText,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      forcuram                             as Amount,
      forcurkey                            as CurrencyCode,
      @Semantics.quantity.unitOfMeasure: 'LuggageWeigthUnit'
      luggweight                           as LuggageWeight,
      wunit                                as LuggageWeigthUnit,
      order_date                           as OrderDate,
      agencynum                            as AgencyNumber,
      counter                              as CounterID,
      customid                             as CustomerID,


      //Aufgabe 6
      forcuram                             as OldAmount,
      forcurkey                            as OldCurrency,
      currency_conversion(
        amount => forcuram,
        source_currency => forcurkey,
        round => '',
        target_currency => cast('USD' as abap.cuky),
        exchange_rate_date => order_date ) as NewPrice,
      cast('USD' as abap.cuky)             as NewCurrency,
      
      DATS_DAYS_BETWEEN(order_date,fldate) as DaysAhead 
}
where
  cancelled <> 'X'
