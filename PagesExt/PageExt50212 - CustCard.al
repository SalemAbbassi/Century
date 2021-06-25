pageextension 50212 CustCardExt extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            /*
            field("Name 2";"Name 2")
            {
                ApplicationArea = all;
            }
            */
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}