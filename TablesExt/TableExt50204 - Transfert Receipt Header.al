tableextension 50204 TransfertReceiptHeaderExt extends "Transfer Receipt Header"
{
    fields
    {
        field(50200; "Customer No."; code[10])
        {
            Caption = 'Customer No.';
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