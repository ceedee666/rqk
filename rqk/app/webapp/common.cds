using { de.fhaachen.rqk as rqk} from '../../db/schema';

annotate rqk.Reviews with @odata.draft.enabled;

////////////////////////////////////////////////////////////////////////////
//
//	Review Lists
//
annotate rqk.Reviews with @(
	UI: {
		SelectionFields: [ customerName, orderNumber, orderDate, rating ],
        DataPoint#RatingDP: {
            Value: rating,
            TargetValue: 10,
            Visualization: #Rating
        },
		LineItem: [
            {$Type: 'UI.DataField', Value: orderNumber, Criticality: criticality, CriticalityRepresentation: #WithIcon},
			{Value: orderDate},
            {Value: status},
            {Value: customerName},
            {$Type: 'UI.DataFieldForAnnotation', Label: '{i18n>Rating}', Target: '@UI.DataPoint#RatingDP'},
			{Value: text}
		]
    }
);


////////////////////////////////////////////////////////////////////////////
//
//	Review Elements
//
annotate rqk.Reviews with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter;
    rating @title : '{i18n>rating}';
    text   @title: '{i18n>text}' @UI.MultiLineText;
    status @title: '{i18n>status}';
    orderNumber @title: '{i18n>orderNumber}';
    orderDate   @title: '{i18n>orderDate}';
    customerName @title: '{i18n>customerName}';
    customerEmail @title: '{i18n>customerEmail}';
};