using ReviewService as service from '../../srv/review-service';

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
        }

    }
);