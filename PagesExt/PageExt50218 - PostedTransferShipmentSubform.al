pageextension 50218 PostedTransferShipmentSubform extends "Posted Transfer Shpt. Subform"
{    
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field(SalesOrderNo; SalesOrderNo)
            {
                ApplicationArea = all;
            }
            field(SalesOrderLineNo; SalesOrderLineNo)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}