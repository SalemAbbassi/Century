tableextension 50218 DBESalesCrMemoHeaderExt extends "Sales Cr.Memo Header"
{
    fields
    {
        // Add changes to table fields here
        field(50250; DBESubType; Option)
        {
            OptionMembers = " ","Consignment";
            OptionCaption = ' ,Consignement';
        }
    }
    
    var
        myInt: Integer;
}