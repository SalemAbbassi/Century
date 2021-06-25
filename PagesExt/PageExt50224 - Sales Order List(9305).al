pageextension 50224 "CTYSales Order List" extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage()

    begin
        SetFilter(DBESubType, '%1', DBESubType::Normal);

    end;

    var
        myInt: Integer;
}