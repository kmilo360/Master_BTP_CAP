using {salesOrders as projection} from '../service';
using from './annotations-items';

/* annotate projection.ItemsSet with @odata.draft.enabled; */

annotate projection.ItemsSet with {
    ID               @title: 'Item';
    name             @title: 'Name';
    description      @title: 'Description';
    releaseDate      @title: 'Release Date';
    discontinuedDate @title: 'Discontinued Date';
    price            @title: 'Price'     @Measures.Unit: currency;
    currency         @title: 'Currency'  @Common.IsUnit;
    height           @title: 'Height'    @Measures.Unit: unitOfMeasure;
    width            @title: 'Width'     @Measures.Unit: unitOfMeasure;
    depth            @title: 'Depth'     @Measures.Unit: unitOfMeasure;
    quantity         @title: 'Quantity';
    unitOfMeasure    @title: 'Unit Of Measure';
    order            @title: 'Order';
};


annotate projection.ItemsSet with @(
    UI.HeaderInfo                 : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    },
    UI.FieldGroup #ItemInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Value: description
            },
            {
                $Type: 'UI.DataField',
                Value: releaseDate
            },
            {
                $Type: 'UI.DataField',
                Value: discontinuedDate
            },
            {
                $Type: 'UI.DataField',
                Value: price
            },
            {
                $Type: 'UI.DataField',
                Value: currency
            },
            {
                $Type: 'UI.DataField',
                Value: height
            },
            {
                $Type: 'UI.DataField',
                Value: width
            },
            {
                $Type: 'UI.DataField',
                Value: depth
            },
            {
                $Type: 'UI.DataField',
                Value: quantity
            },
            {
                $Type: 'UI.DataField',
                Value: unitOfMeasure
            },
            {
                $Type: 'UI.DataField',
                Value: order_ID
            }
        ],
        Label: 'Information'
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#ItemInformation',
        Label : 'Item Information',
    }],
    UI.LineItem                   : [
        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Value: releaseDate,
        },
        {
            $Type: 'UI.DataField',
            Value: discontinuedDate,
        },
        {
            $Type: 'UI.DataField',
            Value: price,
        },
        {
            $Type: 'UI.DataField',
            Value: currency,
        },
        {
            $Type: 'UI.DataField',
            Value: height,
        },
        {
            $Type: 'UI.DataField',
            Value: width,
        },
        {
            $Type: 'UI.DataField',
            Value: depth,
        },
        {
            $Type: 'UI.DataField',
            Value: quantity,
        },
        {
            $Type: 'UI.DataField',
            Value: unitOfMeasure,
        },
        {
            $Type: 'UI.DataField',
            Value: order_ID,
        },
    ],
);
