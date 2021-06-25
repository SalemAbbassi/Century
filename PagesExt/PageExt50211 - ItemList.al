pageextension 50211 ItemListExt extends "Item List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {

        // Add changes to page actions here
        modify("Inventory Purchase Orders")
        {
            Visible = false;
        }
        AddLast(orders)
        {
            action(ActionJUH)
            {
                Caption = 'Commandes achat encours';
                ApplicationArea = all;
                trigger OnAction();
                var
                    rep: report "Inventory Purchase Orders new";
                begin
                    rep.Run;
                end;
            }
        }
    }

    var
        myInt: Integer;
}