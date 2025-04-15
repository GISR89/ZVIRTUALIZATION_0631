@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtualización'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zcds_virtual_discount_0631
  as select from /dmo/flight
{
  key carrier_id                    as CarrierId,
  key connection_id                 as ConnectionId,
  key flight_date                   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                         as Price,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_DISCOUNT_0631'
      cast(0 as abap.curr( 16, 2 )) as RealPrice,
      currency_code                 as CurrencyCode,
      plane_type_id                 as PlaneTypeId,
      seats_max                     as SeatsMax,
      seats_occupied                as SeatsOccupied
}
