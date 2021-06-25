tableextension 50203 TransfertHeaderExt extends "Transfer Header"
{
    fields
    {
        field(50200; "Customer No."; code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";

        }
        field(50250; DBESubType; Option)
        {
            OptionMembers = " ","Consignment";
            OptionCaption = ' ,Consignement';
        }
    }

    var
        myInt: Integer;
}