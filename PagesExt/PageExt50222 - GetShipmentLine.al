pageextension 50222 GetShipmentLine extends "Get Shipment Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Order No.";"Order No.")
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