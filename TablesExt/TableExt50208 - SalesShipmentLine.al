tableextension 50208 SalesShipmentLine extends "Sales Shipment Line"
{
    fields
    {
        // Add changes to table fields here
        field(50200; ExtRef; text[50])
        {
            Caption = 'External Reference';
        }
        field(50250; DBESubType; Option)
        {
            OptionMembers = " ","Consignment";
            OptionCaption = ' ,Consignement';
        }
    }

    var
        myInt: Integer;
}