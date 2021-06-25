tableextension 50219 CGLCurrency extends Currency
{
    fields
    {
        // Add changes to table fields here
        field(50200; CGSLangCode; Text[30])
        {
            Caption = 'Language Code';
        }
        field(50201; CGSRDLFormatNumber; Text[30])
        {
            Caption = 'RDL Format Number';
        }

    }

    var
        myInt: Integer;
}