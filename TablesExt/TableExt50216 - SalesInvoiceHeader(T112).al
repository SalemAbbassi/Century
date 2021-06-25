tableextension 50216 DBESalesInvoiceHeaderExt extends "Sales Invoice Header"
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