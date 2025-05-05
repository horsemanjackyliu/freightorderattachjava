namespace sap.freightorder.db;

entity DBFreightOrder {
  key TransportationOrderUUID : String(36) ;
  TransportationOrder : String(20) ;
  TransportationOrderType : String(4) ;
  TransportationOrderCategory : String(2) ;
  TransportationShippingType : String(3) ;
  TransportationMode : String(2) ;
  TransportationModeCategory : String(1) ;
  CarrierUUID : String(36);
  Carrier : String(10) ;
  StandardCarrierAlphaCode : String(4) ;
  TranspOrdExecutingCarrierUUID : String(36);
  TranspOrdExecutingCarrier : String(10) ;
  ShipperUUID : String(36);
  Shipper : String(10) ;
  ShipperAddressID : String(40) ;
  ConsigneeUUID : String(36);
  Consignee : String(10) ;
  ConsigneeAddressID : String(40) ;
  TranspPurgOrg : String(8) ;
  TranspPurgOrgExtID : String(20) ;
  TranspPurgGroup : String(8) ;
  TranspPurgGroupExtID : String(20) ;
  PurgOrgCompanyCode : String(4) ;
  CarrierAccountNumber : String(14) ;
  TranspMeansOfTransport : String(10) ;
  TranspOrdPartnerReference : String(35) ;
  TranspOrdResponsiblePerson : String(12) ;
  TranspOrdHasMltplExectgPties : Boolean ;
  TranspOrdInvoicingCarrierLevel : String(2) ;
  TranspOrdLifeCycleStatus : String(2) ;
  TranspOrderSubcontrgSts : String(2) ;
  TransportationOrderConfSts : String(2) ;
  TransportationOrderExecSts : String(2) ;
  TranspOrdGoodsMovementStatus : String(1) ;
  TranspOrdWhseProcessingStatus : String(1) ;
  TranspOrderDngrsGdsSts : String(1) ;
  TranspOrdExecutionIsBlocked : Boolean ;
  TransportationOrderCrtnType : String(2) ;
  CreatedByUser : String(12) ;
  FreightOrderItems: Composition of many  DBFreightOrderItem on FreightOrderItems.TransportationOrderUUID = $self.TransportationOrderUUID;

}


entity DBFreightOrderItem  {


  key TransportationOrderItemUUID : String(36) ;
  TransportationOrderUUID : String(36) ;
  TranspOrdItem : String(10) ;
  TranspOrdItemType : String(4) ;
  TranspOrdItemCategory : String(3) ;
  TranspOrdItemParentItemUUID : String(36) ;
  TranspOrdItemDesc : String(40) ;
  IsMainCargoItem : Boolean ;
  TranspOrdItemSorting : String(6) ;

  SourceStopUUID : String(36);
  DestinationStopUUID : String(36);
  ShipperUUID : String(36);
  Shipper : String(10) ;
  ShipperAddressID : String(40) ;
  ConsigneeUUID : String(36);
  Consignee : String(10) ;
  ConsigneeAddressID : String(40) ;


  FreightUnitUUID : String(36);
  PredecessorTransportationOrder : String(36);
  TranspBaseDocument : String(35) ;
  TranspBaseDocumentType : String(5) ;
  TranspBaseDocumentItem : String(10) ;
  TranspBaseDocumentItemType : String(5) ;
  TransportationEquipmentGroup : String(3) ;
  TransportationEquipmentType : String(10) ;
  TranspEquipmentIsShipperOwned : Boolean ;
  TranspEquipmentPlateNumber : String(20) ;
  TranspEquipRegistrationCountry : String(3) ;
  TranspEquipCapacityLength : Decimal(13, 3) ;
  TranspEquipCapacityWidth : Decimal(13, 3) ;
  TranspEquipCapacityHeight : Decimal(13, 3) ;
  TranspEquipCapacityUnit : String(3) ;
  TranspEquipCapacityWeight : Decimal(31, 14) ;
  TranspEquipCapacityWeightUnit : String(3) ;
  TranspEquipCapacityVolume : Decimal(31, 14) ;
  TranspEquipCapacityVolumeUnit : String(3) ;
  TranspOrdItemPackageID : String(35) ;
  ProductUUID : String(36);
  ProductID : String(18) ;
  MaterialFreightGroup : String(8) ;
  TransportationGroup : String(4) ;
  TranspOrdItmMinTemp : Decimal(7, 2) ;
  TranspOrdItmMaxTemp : Decimal(7, 2) ;
  TranspOrdItemTemperatureUnit : String(3) ;
  TranspOrdItemQuantity : Decimal(31, 14) ;
  TranspOrdItemQuantityUnit : String(3) ;
  TranspOrdItemGrossWeight : Decimal(31, 14) ;
  TranspOrdItemGrossWeightUnit : String(3) ;
  TranspOrdItemGrossVolume : Decimal(31, 14) ;
  TranspOrdItemGrossVolumeUnit : String(3) ;
  TranspOrdItemNetWeight : Decimal(31, 14) ;
  TranspOrdItemNetWeightUnit : String(3) ;
}