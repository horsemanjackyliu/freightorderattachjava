using { sap.freightorder.db.DBFreightOrderItem } from '../db/schema';
using { sap.attachments.Attachments } from`com.sap.cds/sdm`;

extend entity DBFreightOrderItem with {
   attachments : Composition of many Attachments;
}