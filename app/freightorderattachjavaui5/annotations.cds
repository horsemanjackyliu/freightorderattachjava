using AdminService as service from '../../srv/services';
using from '../../srv/attachment-extension';

annotate service.FreightOrder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderUUID',
                Value : TransportationOrderUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrder',
                Value : TransportationOrder,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderType',
                Value : TransportationOrderType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderCategory',
                Value : TransportationOrderCategory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationShippingType',
                Value : TransportationShippingType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationMode',
                Value : TransportationMode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationModeCategory',
                Value : TransportationModeCategory,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CarrierUUID',
                Value : CarrierUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Carrier',
                Value : Carrier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StandardCarrierAlphaCode',
                Value : StandardCarrierAlphaCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdExecutingCarrierUUID',
                Value : TranspOrdExecutingCarrierUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdExecutingCarrier',
                Value : TranspOrdExecutingCarrier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ShipperUUID',
                Value : ShipperUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Shipper',
                Value : Shipper,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ShipperAddressID',
                Value : ShipperAddressID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ConsigneeUUID',
                Value : ConsigneeUUID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Consignee',
                Value : Consignee,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ConsigneeAddressID',
                Value : ConsigneeAddressID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgOrg',
                Value : TranspPurgOrg,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgOrgExtID',
                Value : TranspPurgOrgExtID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgGroup',
                Value : TranspPurgGroup,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspPurgGroupExtID',
                Value : TranspPurgGroupExtID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PurgOrgCompanyCode',
                Value : PurgOrgCompanyCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CarrierAccountNumber',
                Value : CarrierAccountNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspMeansOfTransport',
                Value : TranspMeansOfTransport,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdPartnerReference',
                Value : TranspOrdPartnerReference,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdResponsiblePerson',
                Value : TranspOrdResponsiblePerson,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdHasMltplExectgPties',
                Value : TranspOrdHasMltplExectgPties,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdInvoicingCarrierLevel',
                Value : TranspOrdInvoicingCarrierLevel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdLifeCycleStatus',
                Value : TranspOrdLifeCycleStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrderSubcontrgSts',
                Value : TranspOrderSubcontrgSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderConfSts',
                Value : TransportationOrderConfSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderExecSts',
                Value : TransportationOrderExecSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdGoodsMovementStatus',
                Value : TranspOrdGoodsMovementStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdWhseProcessingStatus',
                Value : TranspOrdWhseProcessingStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrderDngrsGdsSts',
                Value : TranspOrderDngrsGdsSts,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TranspOrdExecutionIsBlocked',
                Value : TranspOrdExecutionIsBlocked,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TransportationOrderCrtnType',
                Value : TransportationOrderCrtnType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CreatedByUser',
                Value : CreatedByUser,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Freightorderitems}',
            ID : 'i18nFreightorderitems',
            Target : 'FreightOrderItems/@UI.LineItem#i18nFreightorderitems',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrderUUID',
            Value : TransportationOrderUUID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrder',
            Value : TransportationOrder,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrderType',
            Value : TransportationOrderType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationOrderCategory',
            Value : TransportationOrderCategory,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TransportationShippingType',
            Value : TransportationShippingType,
        },
    ],
);

annotate service.FreightOrderItem with @(
    UI.LineItem #i18nFreightorderitems : [
        {
            $Type : 'UI.DataField',
            Value : Consignee,
            Label : 'Consignee',
        },
        {
            $Type : 'UI.DataField',
            Value : IsMainCargoItem,
            Label : 'IsMainCargoItem',
        },
        {
            $Type : 'UI.DataField',
            Value : MaterialFreightGroup,
            Label : 'MaterialFreightGroup',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductID,
            Label : 'ProductID',
        },
        {
            $Type : 'UI.DataField',
            Value : Shipper,
            Label : 'Shipper',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspBaseDocument,
            Label : 'TranspBaseDocument',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspBaseDocumentItem,
            Label : 'TranspBaseDocumentItem',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspBaseDocumentItemType,
            Label : 'TranspBaseDocumentItemType',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspBaseDocumentType,
            Label : 'TranspBaseDocumentType',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItem,
            Label : 'TranspOrdItem',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemCategory,
            Label : 'TranspOrdItemCategory',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemDesc,
            Label : 'TranspOrdItemDesc',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemGrossVolume,
            Label : 'TranspOrdItemGrossVolume',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemGrossVolumeUnit,
            Label : 'TranspOrdItemGrossVolumeUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemGrossWeight,
            Label : 'TranspOrdItemGrossWeight',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemGrossWeightUnit,
            Label : 'TranspOrdItemGrossWeightUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemNetWeight,
            Label : 'TranspOrdItemNetWeight',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemNetWeightUnit,
            Label : 'TranspOrdItemNetWeightUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemPackageID,
            Label : 'TranspOrdItemPackageID',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemQuantity,
            Label : 'TranspOrdItemQuantity',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemQuantityUnit,
            Label : 'TranspOrdItemQuantityUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItemType,
            Label : 'TranspOrdItemType',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItmMaxTemp,
            Label : 'TranspOrdItmMaxTemp',
        },
        {
            $Type : 'UI.DataField',
            Value : TranspOrdItmMinTemp,
            Label : 'TranspOrdItmMinTemp',
        },
        {
            $Type : 'UI.DataField',
            Value : TransportationEquipmentGroup,
            Label : 'TransportationEquipmentGroup',
        },
        {
            $Type : 'UI.DataField',
            Value : TransportationEquipmentType,
            Label : 'TransportationEquipmentType',
        },
        {
            $Type : 'UI.DataField',
            Value : TransportationGroup,
            Label : 'TransportationGroup',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Freightorderitemdetails}',
            ID : 'i18nFreightorderitemdetails',
            Target : '@UI.FieldGroup#i18nFreightorderitemdetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Attachmentlist}',
            ID : 'i18nAttachmentlist',
            Target : 'attachments/@UI.LineItem#i18nAttachmentlist',
        },
    ],
    UI.FieldGroup #i18nFreightorderitemdetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Consignee,
                Label : 'Consignee',
            },
            {
                $Type : 'UI.DataField',
                Value : ProductID,
                Label : 'ProductID',
            },
            {
                $Type : 'UI.DataField',
                Value : Shipper,
                Label : 'Shipper',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItem,
                Label : 'TranspOrdItem',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemCategory,
                Label : 'TranspOrdItemCategory',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemDesc,
                Label : 'TranspOrdItemDesc',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossVolume,
                Label : 'TranspOrdItemGrossVolume',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossVolumeUnit,
                Label : 'TranspOrdItemGrossVolumeUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossWeight,
                Label : 'TranspOrdItemGrossWeight',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemGrossWeightUnit,
                Label : 'TranspOrdItemGrossWeightUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemNetWeight,
                Label : 'TranspOrdItemNetWeight',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemNetWeightUnit,
                Label : 'TranspOrdItemNetWeightUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemPackageID,
                Label : 'TranspOrdItemPackageID',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemQuantity,
                Label : 'TranspOrdItemQuantity',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemQuantityUnit,
                Label : 'TranspOrdItemQuantityUnit',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItemType,
                Label : 'TranspOrdItemType',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItmMaxTemp,
                Label : 'TranspOrdItmMaxTemp',
            },
            {
                $Type : 'UI.DataField',
                Value : TranspOrdItmMinTemp,
                Label : 'TranspOrdItmMinTemp',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationEquipmentGroup,
                Label : 'TransportationEquipmentGroup',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationEquipmentType,
                Label : 'TransportationEquipmentType',
            },
            {
                $Type : 'UI.DataField',
                Value : TransportationGroup,
                Label : 'TransportationGroup',
            },
        ],
    },
);

annotate service.FreightOrderItem.attachments with @(
    UI.LineItem #i18nAttachmentlist : [
        {
            $Type : 'UI.DataField',
            Value : fileName,
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : note,
        },
    ]
);

