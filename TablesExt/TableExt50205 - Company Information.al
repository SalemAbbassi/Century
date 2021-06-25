tableextension 50205 CompanyInformationExt extends "Company Information"
{
    fields
    {
        // Add changes to table fields here
        field(50200; Sign1; Text[50])
        {
            Caption = 'Sign 1';
        }
        field(50201; Sign2; Text[50])
        {
            Caption = 'Sign 2';
        }
        field(50202; Sign1Image; Blob)
        {
            Caption = 'Image Sign 1';
            Subtype = Bitmap;
        }
        field(50203; Sign2Image; Blob)
        {
            Caption = 'Image Sign 2';
            Subtype = Bitmap;
        }
    }

    var
        myInt: Integer;
}