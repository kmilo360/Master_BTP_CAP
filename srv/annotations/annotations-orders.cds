using {salesOrders as projection} from '../service';
using from './annotations-items';

annotate projection.OrdersSet with @odata.draft.enabled;

annotate projection.OrdersSet with {
    ID           @title: 'Order';
    email @title : 'Email' @Common: {
        Text : email,
        TextArrangement : #TextOnly
    };
    firstName    @title: 'First Name';
    lasttName    @title: 'Last Name';
    country      @title: 'Country';
    createon     @title: 'Createon';
    deliveryDate @title: 'DeliveryDate';
    orderStatus  @title: 'Order Status';
    criticality  @title: 'Criticality';
    imageUrl     @title: 'ImageUrl';
};


annotate projection.OrdersSet with @(
 /*   
    UI.HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Order',
        TypeNamePlural : 'Orders',
        Title : {
            $Type : 'UI.DataField',
            Value : firstName,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : email
        }
    },
*/
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
            },        
       
            {
                $Type : 'UI.DataField',
                Value : orderStatus_code,
                Criticality: criticality,
                Label: 'Order Status'
            }         
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
    UI.Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#OrderInformation',
            Label : 'Order Information',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'toItems/@UI.LineItem',
            Label : 'Items Information',
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
            Criticality: criticality,
            Label: ''
        },
/*    
        {
            $Type : 'UI.DataField',
            Value : criticality,
        },
*/      
        {
            $Type : 'UI.DataField',
            Value : imageUrl,
        },
    ],
);