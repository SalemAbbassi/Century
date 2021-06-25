pageextension 50214 ProdOrderComponentsExt extends "Prod. Order Components"
{
    layout
    {
        modify("Location Code")
        {
            ApplicationArea = all;
            Visible = true;
        }
    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}