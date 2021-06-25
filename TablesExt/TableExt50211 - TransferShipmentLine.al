tableextension 50211 TransferShipmentLine extends "Transfer Shipment Line"
{
    fields
    {
        // Add changes to table fields here
        field(50200; ExtRef; text[50])
        {
            Caption = 'External Reference';
        }
        field(50210; SalesOrderNo; code[20])
        {
            Caption = 'Sales Order No.';            
        }
        field(50211; SalesOrderLineNo; Integer)
        {
            Caption = 'Sales Order Line No.';            
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