using ManageService as service from '../../srv/manage-service';

annotate service.Reviews with @(
    UI : {
        HeaderInfo : {
            TypeName       : '{i18n>reviewTypeName}',
            TypeNamePlural : '{i18n>reviewTypeNamePlural}',
            TypeImageUrl   : 'sap-icon://measure',
            Title          : {
                Value : '{i18n>reviewHeaderText}'
            }
        },
        HeaderFacets: [
            { $Type  : 'UI.ReferenceFacet', Target : '@UI.FieldGroup#HeaderGeneralInformation'}
        ],
        Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>reviewFacet}', Target: '@UI.FieldGroup#Review'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>adminFacet}', Target: '@UI.FieldGroup#Admin'},
        ],

        FieldGroup #HeaderGeneralInformation : {
            $Type : 'UI.FieldGroupType',
            Data : [
                { Value : orderNumber },
                { Value : orderDate },
                { Value : customerName },
                { Value : customerEmail }
            ]
        },

        FieldGroup#Review: {
            Data: [
              {$Type: 'UI.DataFieldForAnnotation', Label: '{i18n>Rating}', Target: '@UI.DataPoint#RatingDP'},
              {Value: text},
           ]
        },

        FieldGroup#Admin: {
            Data: [
              {Value: status},
              {Value: createdBy},
              {Value: createdAt},
              {Value: modifiedBy},
              {Value: modifiedAt}
            ]
        }

    }
);
