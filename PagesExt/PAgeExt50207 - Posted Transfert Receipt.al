pageextension 50207 PostedTransfertReceipt extends "Posted Transfer Receipt"
{
    layout
    {
        addbefore("Transfer-from Code")
        {
            field("Customer No."; "Customer No.")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        
        // Add changes to page actions here
        modify("Co&mments")
        {
            Visible = true;
            ApplicationArea = all;
        }
    }

    var
        myInt: Integer;
}