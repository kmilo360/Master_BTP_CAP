namespace com.salesorders;

using {
        cuid,
        managed,
        sap.common.CodeList
} from '@sap/cds/common';

entity Orders : cuid, managed {
        email        : String(30);
        firstName    : String(30);
        lasttName    : String(30);
        country      : String(30);
        createon     : Date;
        deliveryDate : DateTime;
        availability : Association to Availability;
        criticality  : Integer;
        imageUrl     : LargeBinary  @Ui.IsImage  @Core.MediaType: mimeType  @Core.ContentDisposition.Filename: fileName;
        mimeType     : String       @Core.IsMediaType;
        fileName     : String;
        toItems      : Composition of many Items
                               on toItems.order = $self;
};

entity Items : cuid {
        order            : Association to Orders; //order_ID
        name             : String(40);
        description      : String(40);
        releaseDate      : Date;
        discontinuedDate : Date;
        price            : Decimal(12, 2);
        currency         : String(3);
        height           : Decimal(15, 3);
        width            : Decimal(15, 3);
        depth            : Decimal(12, 2);
        quantity         : Decimal(16, 2);
        unitOfMeasure    : String(2) default 'CM';

};

/*
* Entidades de ayuda
 */
entity Availability : CodeList {
        key code : String enum {
                    Acepted  = 'Acepted'; // 3 VERDE
                    Open     = 'Open'; // 2 NARANJA
                    Rejected = 'Rejected'; // 1 ROJO
            }
}
