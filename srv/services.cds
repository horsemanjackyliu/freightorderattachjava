using {
    sap.freightorder.db.DBFreightOrder,
    sap.freightorder.db.DBFreightOrderItem
} from '../db/schema';

using {FREIGHTORDER_0001 as api} from './external/FREIGHTORDER_0001';


service AdminService {

    entity FreightOrderExt      as
        projection on api.FreightOrder {
            key TransportationOrderUUID,
                TransportationOrder,
                TranspOrdExecutingCarrier
        };

    entity SRV_FreightOrder     as projection on DBFreightOrder;
    entity SRV_FreightOrderItem as projection on DBFreightOrderItem;

}


annotate AdminService with @(requires: 'admin');
