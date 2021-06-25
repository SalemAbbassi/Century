pageextension 50208 CompanyInformationExt extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
        addafter(Picture)
        {
            field(Sign1; Sign1)
            {
                ApplicationArea = All;
            }
            field(Sign1Image; Sign1Image)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    CurrPage.SAVERECORD;
                end;
            }
            field(Sign2; Sign2)
            {
                ApplicationArea = all;
            }
            field(Sign2Image; Sign2Image)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    CurrPage.SAVERECORD;
                end;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}