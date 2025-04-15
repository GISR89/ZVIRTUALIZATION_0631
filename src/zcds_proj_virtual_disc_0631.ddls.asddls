@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtualización'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_proj_virtual_disc_0631
  provider contract transactional_query
  as projection on zcds_virtual_discount_0631
{
  key     CarrierId,
  key     ConnectionId,
  key     FlightDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          Price,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_DISCOUNT_0631'
  virtual RealPrice : abap.curr( 16, 2 ),
          CurrencyCode,
          PlaneTypeId,
          SeatsMax,
          SeatsOccupied
}
