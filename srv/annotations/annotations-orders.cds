using {salesOrders as projection} from '../service';
using from './annotations-items';

annotate projection.OrdersSet with @odata.draft.enabled;

annotate projection.OrdersSet with {
    ID           @title: 'Order';
    email @title : 'Email' @Common: {
        Text : email,
        TextArrangement : #TextOnly
    };
    firstName    @title: 'firstName';
    lasttName    @title: 'lastName';
    country      @title: 'country';
    createon     @title: 'createon';
    deliveryDate @title: 'deliveryDate';
    orderStatus  @title: 'orderStatus';
    criticality  @title: 'criticality';
    imageUrl     @title: 'imageUrl';
};


annotate projection.OrdersSet with @(
    UI.FieldGroup #OrderInformation: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID
            },   
            {
                $Type : 'UI.DataField',
                Value : firstName
            },
            {
                $Type : 'UI.DataField',
                Value : email
            }
        ],
        Label : 'Information'
    },
    UI.Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#OrderInformation',
            Label : 'Order Information',
        }
    ],
    UI.LineItem  : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Value : lasttName,
        },
        {
            $Type : 'UI.DataField',
            Value : country,
        },
        {
            $Type : 'UI.DataField',
            Value : deliveryDate,
        },
        {
            $Type : 'UI.DataField',
            Value : orderStatus_code,
        },
        {
            $Type : 'UI.DataField',
            Value : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : imageUrl,
        },
    ],
);