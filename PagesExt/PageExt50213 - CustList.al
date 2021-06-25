pageextension 50213 CustListExt extends "Customer List"
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