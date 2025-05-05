

cds init freightorderattach


```
cds init freightorderattachjava --java
```
create schema.cds under folder db with the following code .
```
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
```

srv/pom.xml

```xml
		<dependency>
			<groupId>com.sap.cds</groupId>
			<artifactId>sdm</artifactId>
			<version>1.2.0</version>
		</dependency>
```

srv/attachment-extension.cds
```js
using { sap.freightorder.db.DBFreightOrderItem } from '../db/schema';
using { sap.attachments.Attachments } from`com.sap.cds/sdm`;

extend entity DBFreightOrderItem with {
   attachments : Composition of many Attachments;
}
```


srv/pom.xml
```
<dependency>
  <groupId>com.sap.cds</groupId>
  <artifactId>cds-feature-enterprise-messaging</artifactId>
  <scope>runtime</scope>
</dependency>

```

srv/src/main/resources/application.yaml

```
cds:
  messaging.services:
  - name: "freightorderattachjava"
    kind: "enterprise-messaging"

```



cds import srv/external/CE_FREIGHTORDER_0001.edmx --as cds




```bash

cf create-service enterprise-messaging default freightorderattachjava-messaging -c event-mesh.json
cf create-service-key freightorderattachjava-messaging em-key
cds bind -2 freightorderattachjava-messaging:em-key 


```



cap/attch/java/ce/sap/s4/beh/FreightOrder/Created/v1

```
{
"type":"sap.s4.beh.FreightOrder.Created.v1",
"specversion":"1.0",
"source":"/default/sap.s4.beh/740623809",
"id":"07bebe98-fbca-1edf-bfe9-9231767df4f1",
"time":"2025-03-12T14:16:20Z",
"datacontenttype":"application/json",
"data":
{
"TransportationOrderUUID":"07bebe98-fbca-1edf-bfe9-91f3ddb074f1",
"TransportationOrder":"6600000955",
"TransportationOrderType":"SFO2",
"TransportationMode":"01",
"TransportationShippingType":"18",
"Carrier":"13386001",
"TranspPurgOrgExtID":""
}
}

```

