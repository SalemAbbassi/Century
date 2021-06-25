pageextension 50215 SalesQuote extends "Sales Quote"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Sell-to Customer Name 2";"Sell-to Customer Name 2")
            {
                ApplicationArea = all;                
            }
        }
        addafter("Bill-to Name")
        {
            field("Bill-to Name 2";"Bill-to Name 2")
            {
                ApplicationArea = all;
            }
        }
        addafter("Ship-to Name")
        {
            field("Ship-to Name 2";"Ship-to Name 2")
            {
                ApplicationArea = all;
            }
        }
        addafter(Status)
        {
            field("Customer Price Group";"Customer Price Group")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}