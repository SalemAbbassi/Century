pageextension 50209 SalesOrderSubFormExt extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2";"Description 2")
            {
                ApplicationArea = all;
            }
            field(ExtRef;ExtRef)
            {
                ApplicationArea = all;
            }
        }
        addafter("Quantity Invoiced")
        {
            
            
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