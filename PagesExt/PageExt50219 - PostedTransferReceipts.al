pageextension 50219 PostedTransferReceipts extends "Posted Transfer Receipts"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("Customer No."; "Customer No.")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        
        addafter(Dimensions)
        {
            action(comment2)
            {
                Promoted = true;
                PromotedCategory = Category4;
                Image = Comment;
                Caption = 'Comments';
                ApplicationArea = all;
                RunObject = page "Inventory Comment Sheet";
                RunPageLink = "Document Type" = const ("Posted Transfer Receipt"), "No." = field ("No.");
            }
        }
    }
    
    var
        myInt: Integer;
}