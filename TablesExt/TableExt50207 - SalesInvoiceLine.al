tableextension 50207 SalesInvoiceLineExt extends "Sales Invoice Line"
{
    fields
    {
        field(50200; ExtRef; text[50])
        {
            Caption = 'External Reference';
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