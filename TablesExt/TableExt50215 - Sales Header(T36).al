tableextension 50215 DBESalesHeaderExt extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50250; DBESubType; Option)
        {
            Caption = 'Sub-Type';
            OptionMembers = "Normal","Consignment";
            OptionCaption = 'Normal,Consignement';
        }
    }

    var
        myInt: Integer;
}