pageextension 50216 TransferOrderSubform extends "Transfer Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(SalesOrderNo;SalesOrderNo)
            {
                ApplicationArea = all;                
            }
            field(SalesOrderLineNo;SalesOrderLineNo)
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