tableextension 50217 DBESalesShipmentHeaderExt extends "Sales Shipment Header"
{
    fields
    {
        // Add changes to table fields here
        field(50250; DBESubType; Option)
        {
            OptionMembers = " ","Consignment";
            OptionCaption = ' ,Consignement';
        }
    }
    
    var
        myInt: Integer;
}