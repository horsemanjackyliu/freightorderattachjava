using { sap.freightorder.db.DBFreightOrder,sap.freightorder.db.DBFreightOrderItem } from '../db/schema';

using {CE_FREIGHTORDER_0001.FreightOrder } from './external/CE_FREIGHTORDER_0001';


service AdminService {

    entity FreightOrderExt as projection on FreightOrder;

    entity FreightOrder as projection on DBFreightOrder;

    entity FreightOrderItem as projection on DBFreightOrderItem;

}


annotate AdminService with @(requires: 'admin');
