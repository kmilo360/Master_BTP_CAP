using {salesOrders as projection} from '../service';
using from './annotations-items';

annotate projection.OrdersSet with @odata.draft.enabled;

annotate projection.OrdersSet with {
    ID           @title: 'Order';
    email        @title: 'Email'  @mandatory;
    firstName    @title: 'First Name';
    lasttName    @title: 'Last Name';
    country      @title: 'Country';
    createon     @title: 'Create on';
    deliveryDate @title: 'Delivery Date';
    availability @title: 'Order Status';
    imageUrl     @title: 'ImageUrl';
};

annotate projection.OrdersSet with {
    availability @Common: {
        Text           : availability.name,
        TextArrangement: #TextOnly
    }
};

annotate projection.OrdersSet with @(
    /*
       UI.HeaderInfo  : {
           $Type : 'UI.HeaderInfoType',
           TypeName : 'Order',
           TypeNamePlural : 'Orders',
           Title : {
               $Type : 'UI.DataField',
               Value : ID
           }
       },
   */
    UI.SelectionFields             : [availability_code],
    UI.FieldGroup #OrderInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Value: email
            },
            {
                $Type: 'UI.DataField',
                Value: firstName
            },
            {
                $Type: 'UI.DataField',
                Value: lasttName
            },
            {
                $Type: 'UI.DataField',
                Value: country
            },
            {
                $Type: 'UI.DataField',
                Value: createon
            },
            {
                $Type: 'UI.DataField',
                Value: deliveryDate
            },
            {
                $Type      : 'UI.DataField',
                Value      : availability_code,
                Criticality: criticality

            },
            {
                $Type: 'UI.DataField',
                Value: imageUrl
            },
        ]
    /*        Label : 'Information' */
    },
    /*
           UI.FieldGroup #Criticality : {
           $Type : 'UI.FieldGroupType',
           Data : [
               {
                   $Type : 'UI.DataField',
                   Value : orderStatus_code,
                   Criticality : criticality,
                   Label : ''
               }
           ]
       },
    /*
   /*
   UI.HeaderFacets  : [

           {
               $Type : 'UI.ReferenceFacet',
               Target : '@UI.FieldGroup#OrderInformation',
               Label: 'Order Information'
           },

           {
               $Type : 'UI.ReferenceFacet',
               Target : '@UI.FieldGroup#Criticality',
               Label : 'Order Status'
           },
       ],
   */
    UI.Facets                      : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#OrderInformation',
            Label : 'Order Information',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'toItems/@UI.LineItem',
            Label : 'Items Information',
        }
    ],
    UI.LineItem                    : [
        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Value: firstName,
        },
        {
            $Type: 'UI.DataField',
            Value: lasttName,
        },
        {
            $Type: 'UI.DataField',
            Value: country,
        },
        {
            $Type: 'UI.DataField',
            Value: createon,
        },
        {
            $Type: 'UI.DataField',
            Value: deliveryDate,
        },
        {
            $Type                : 'UI.DataField',
            Value                : availability_code,
            Criticality          : criticality,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem'
            }
        },
        {
            $Type: 'UI.DataField',
            Value: imageUrl,
        },
    ],
);
