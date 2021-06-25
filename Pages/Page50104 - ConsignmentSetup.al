page 50104 DBEConsignmentSetup
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = DBEConsignmentSetup;
    Caption = 'Consignment Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(CENTURYAutoConsignment; CENTURYAutoConsignment)
                {
                    ApplicationArea = all;
                }
            }
            group(Locations)
            {
                Caption = 'Locations';
                field(DBELocationSource; DBELocationSource)
                {
                    ApplicationArea = All;

                }
                field(DBELocationTarget; DBELocationTarget)
                {
                    ApplicationArea = All;

                }
                field(DBELocationTransit; DBELocationTransit)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}