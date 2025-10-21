package customer.freightorderattachjava.handler;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.ql.Insert;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.cds.CdsReadEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.messaging.TopicMessageEventContext;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.adminservice.AdminService_;
import cds.gen.adminservice.FreightOrderExt_;
import cds.gen.adminservice.SRVFreightOrder;
import cds.gen.adminservice.SRVFreightOrderItem;
import cds.gen.freightorder_0001.FreightOrder;
import cds.gen.freightorder_0001.FreightOrderItem;
import cds.gen.freightorder_0001.FreightOrderItem_;
import cds.gen.freightorder_0001.FreightOrder_;

@Component
@ServiceName(AdminService_.CDS_NAME)
public class ServiceHandler implements EventHandler {

    private static final Logger logger = LoggerFactory.getLogger(ServiceHandler.class);

    PersistenceService db;

    @Autowired
    @Qualifier("FREIGHTORDER_0001")
    CqnService remotService;

    public ServiceHandler(PersistenceService db) {
        this.db = db;
    }

    @On(service = "freightorderattachjava-messaging", event = "ce/sap/s4/beh/FreightOrder/Created/v1")
    public void receiveFreightOrderCreated(TopicMessageEventContext context) {

        logger.info("admin service");
        String msgId = context.getMessageId();
        Map<String, Object> payloadMap = context.getDataMap();

        String freightOrderUuid = payloadMap.get("TransportationOrderUUID").toString();

        logger.info("Fetching Freight Order with UUID: " + freightOrderUuid);

        CqnSelect queryHeader = Select.from(FreightOrder_.class)
                .where(b -> b.TransportationOrderUUID().eq(freightOrderUuid));
        FreightOrder freightOrder = remotService.run(queryHeader).single(FreightOrder.class);

        CqnSelect queryItems = Select.from(FreightOrderItem_.class)
                .where(b -> b.TransportationOrderUUID().eq(freightOrderUuid));
        List<FreightOrderItem> freightOrderItems = remotService.run(queryItems).listOf(FreightOrderItem.class);

        List<SRVFreightOrderItem> dbFreightOrderItems = freightOrderItems.stream().map(item -> {
            SRVFreightOrderItem dbItem = cds.gen.adminservice.SRVFreightOrderItem.create();

            // Map fields from FreightOrderItem to SRVFreightOrderItem
            dbItem.setTransportationOrderUUID(item.getTransportationOrderUUID());
            dbItem.setTranspBaseDocument(item.getTranspBaseDocument());
            dbItem.setConsignee(item.getConsignee());
            dbItem.setShipper(item.getShipper());
            dbItem.setConsignee(item.getConsignee());
            dbItem.setConsigneeAddressID(item.getConsigneeAddressID());
            dbItem.setShipperUUID(item.getShipperUUID());
            dbItem.setDestinationStopUUID(item.getDestinationStopUUID());
            dbItem.setFreightUnitUUID(item.getFreightUnitUUID());
            dbItem.setIsMainCargoItem(item.getIsMainCargoItem());
            dbItem.setMaterialFreightGroup(item.getMaterialFreightGroup());
            dbItem.setPredecessorTransportationOrder(item.getPredecessorTransportationOrder());
            dbItem.setProductID(item.getProductID());
            dbItem.setShipperAddressID(item.getShipperAddressID());
            dbItem.setProductUUID(item.getProductUUID());
            dbItem.setShipperUUID(item.getShipperUUID());
            dbItem.setSourceStopUUID(item.getSourceStopUUID());
            dbItem.setTranspBaseDocumentItem(item.getTranspBaseDocumentItem());
            dbItem.setTranspBaseDocumentItemType(item.getTranspBaseDocumentItemType());
            dbItem.setTranspBaseDocumentType(item.getTranspBaseDocumentType());
            dbItem.setTranspEquipCapacityHeight(item.getTranspEquipCapacityHeight());
            dbItem.setTranspEquipCapacityLength(item.getTranspEquipCapacityLength());
            dbItem.setTranspEquipCapacityUnit(item.getTranspEquipCapacityUnit());
            dbItem.setTranspEquipCapacityVolume(item.getTranspEquipCapacityVolume());
            dbItem.setTranspEquipCapacityVolumeUnit(item.getTranspEquipCapacityVolumeUnit());
            dbItem.setTranspEquipCapacityWeight(item.getTranspEquipCapacityWeight());
            dbItem.setTranspEquipCapacityWeightUnit(item.getTranspEquipCapacityWeightUnit());
            dbItem.setTranspEquipCapacityWidth(item.getTranspEquipCapacityWidth());
            dbItem.setTranspEquipRegistrationCountry(item.getTranspEquipRegistrationCountry());
            dbItem.setTranspEquipmentIsShipperOwned(item.getTranspEquipmentIsShipperOwned());
            dbItem.setTranspEquipmentPlateNumber(item.getTranspEquipmentPlateNumber());
            dbItem.setTranspOrdItem(item.getTranspOrdItem());
            dbItem.setTranspOrdItemCategory(item.getTranspOrdItemCategory());
            dbItem.setTranspOrdItemDesc(item.getTranspOrdItemDesc());
            dbItem.setTranspOrdItemGrossVolume(item.getTranspOrdItemGrossVolume());
            dbItem.setTranspOrdItemGrossVolumeUnit(item.getTranspOrdItemGrossVolumeUnit());
            dbItem.setTranspOrdItemNetWeight(item.getTranspOrdItemNetWeight());
            dbItem.setTranspOrdItemNetWeightUnit(item.getTranspOrdItemNetWeightUnit());
            dbItem.setTranspOrdItemPackageID(item.getTranspOrdItemPackageID());
            dbItem.setTranspOrdItemParentItemUUID(item.getTranspOrdItemParentItemUUID());
            dbItem.setTranspOrdItemQuantity(item.getTranspOrdItemQuantity());
            dbItem.setTranspOrdItemQuantityUnit(item.getTranspOrdItemQuantityUnit());
            dbItem.setTranspOrdItemSorting(item.getTranspOrdItemSorting());
            dbItem.setTranspOrdItemTemperatureUnit(item.getTranspOrdItemTemperatureUnit());
            dbItem.setTranspOrdItemType(item.getTranspOrdItemType());
            dbItem.setTranspOrdItmMaxTemp(item.getTranspOrdItmMaxTemp());
            dbItem.setTranspOrdItmMinTemp(item.getTranspOrdItmMinTemp());
            dbItem.setTransportationEquipmentGroup(item.getTransportationEquipmentGroup());
            dbItem.setTransportationEquipmentType(item.getTransportationEquipmentType());
            dbItem.setTransportationGroup(item.getTransportationGroup());
            dbItem.setTransportationOrderItemUUID(item.getTransportationOrderItemUUID());

            // Add more field mappings as needed

            return dbItem;
        }).toList();

        SRVFreightOrder dbfreightOrder = cds.gen.adminservice.SRVFreightOrder.create();

        dbfreightOrder.setFreightOrderItems(dbFreightOrderItems);

        dbfreightOrder.setTransportationOrderUUID(freightOrder.getTransportationOrderUUID());
        dbfreightOrder.setTransportationOrder(freightOrder.getTransportationOrder());
        dbfreightOrder.setTranspOrdExecutingCarrier(freightOrder.getTranspOrdExecutingCarrier());
        dbfreightOrder.setCarrier(freightOrder.getCarrier());
        dbfreightOrder.setCarrierAccountNumber(freightOrder.getCarrierAccountNumber());
        dbfreightOrder.setCarrierUUID(freightOrder.getCarrierUUID());
        dbfreightOrder.setConsignee(freightOrder.getConsignee());
        dbfreightOrder.setConsigneeAddressID(freightOrder.getConsigneeAddressID());
        dbfreightOrder.setConsigneeUUID(freightOrder.getConsigneeUUID());
        dbfreightOrder.setCreatedByUser(freightOrder.getCreatedByUser());
        dbfreightOrder.setPurgOrgCompanyCode(freightOrder.getPurgOrgCompanyCode());
        dbfreightOrder.setShipper(freightOrder.getShipper());
        dbfreightOrder.setShipperAddressID(freightOrder.getShipperAddressID());
        dbfreightOrder.setShipperUUID(freightOrder.getShipperUUID());
        dbfreightOrder.setStandardCarrierAlphaCode(freightOrder.getStandardCarrierAlphaCode());
        dbfreightOrder.setTransportationOrder(freightOrder.getTransportationOrder());
        dbfreightOrder.setTransportationOrderCategory(freightOrder.getTransportationOrderCategory());
        dbfreightOrder.setTransportationOrderConfSts(freightOrder.getTransportationOrderConfSts());
        dbfreightOrder.setTransportationOrderCrtnType(freightOrder.getTransportationOrderCrtnType());
        dbfreightOrder.setTransportationOrderExecSts(freightOrder.getTransportationOrderExecSts());
        dbfreightOrder.setTransportationOrderType(freightOrder.getTransportationOrderType());
        dbfreightOrder.setTranspMeansOfTransport(freightOrder.getTranspMeansOfTransport());
        dbfreightOrder.setTranspOrdExecutingCarrier(freightOrder.getTranspOrdExecutingCarrier());
        dbfreightOrder.setTranspOrdExecutingCarrierUUID(freightOrder.getTranspOrdExecutingCarrierUUID());
        dbfreightOrder.setTranspOrdExecutionIsBlocked(freightOrder.getTranspOrdExecutionIsBlocked());
        dbfreightOrder.setTranspOrdGoodsMovementStatus(freightOrder.getTranspOrdGoodsMovementStatus());
        dbfreightOrder.setTranspOrdHasMltplExectgPties(freightOrder.getTranspOrdHasMltplExectgPties());
        dbfreightOrder.setTranspOrdInvoicingCarrierLevel(freightOrder.getTranspOrdInvoicingCarrierLevel());
        dbfreightOrder.setTranspOrdLifeCycleStatus(freightOrder.getTranspOrdLifeCycleStatus());
        dbfreightOrder.setTranspOrdPartnerReference(freightOrder.getTranspOrdPartnerReference());
        dbfreightOrder.setTranspOrdResponsiblePerson(freightOrder.getTranspOrdResponsiblePerson());
        dbfreightOrder.setTranspOrdWhseProcessingStatus(freightOrder.getTranspOrdWhseProcessingStatus());
        dbfreightOrder.setTranspOrderDngrsGdsSts(freightOrder.getTranspOrderDngrsGdsSts());
        dbfreightOrder.setTranspOrderSubcontrgSts(freightOrder.getTranspOrderSubcontrgSts());
        dbfreightOrder.setTranspPurgGroup(freightOrder.getTranspPurgGroup());
        dbfreightOrder.setTranspPurgGroupExtID(freightOrder.getTranspPurgGroupExtID());
        dbfreightOrder.setTranspPurgOrg(freightOrder.getTranspPurgOrg());
        dbfreightOrder.setTranspPurgOrgExtID(freightOrder.getTranspPurgOrgExtID());
        dbfreightOrder.setTransportationMode(freightOrder.getTransportationMode());
        dbfreightOrder.setTransportationModeCategory(freightOrder.getTransportationModeCategory());
        dbfreightOrder.setTransportationOrder(freightOrder.getTransportationOrder());
        dbfreightOrder.setTransportationOrderCategory(freightOrder.getTransportationOrderCategory());
        dbfreightOrder.setTransportationOrderConfSts(freightOrder.getTransportationOrderConfSts());
        dbfreightOrder.setTransportationOrderCrtnType(freightOrder.getTransportationOrderCrtnType());
        dbfreightOrder.setTransportationOrderExecSts(freightOrder.getTransportationOrderExecSts());
        dbfreightOrder.setTransportationOrderType(freightOrder.getTransportationOrderType());
        dbfreightOrder.setTransportationShippingType(freightOrder.getTransportationShippingType());

        db.run(Insert.into(cds.gen.adminservice.SRVFreightOrder_.class).entry(dbfreightOrder));
        // db.run(Insert.into(cds.gen.adminservice.SRVFreightOrderItem_.class).entries(dbFreightOrderItems));

        // logger.info(msgId);
        // logger.info(payloadMap.toString());

    }

    @On(event = CqnService.EVENT_READ, entity = FreightOrderExt_.CDS_NAME)
    public void onReadFreightOrder(CdsReadEventContext context) {
        CqnSelect query = Select.from(FreightOrder_.class)
                .columns("TransportationOrderUUID", "TransportationOrder", " TranspOrdExecutingCarrier").limit(20);

        Result result = remotService.run(query);

        logger.info("Fetched Freight Orders: " + result.list().size());

        context.setResult(result);

        logger.info("onReadFreightOrder called");
    }

}
