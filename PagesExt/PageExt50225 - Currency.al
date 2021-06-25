pageextension 50225 CGSCurrencies extends Currencies
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field(CGSLangCode; CGSLangCode)
            {
                ApplicationArea = all;
            }
            field(CGSRDLFormatNumber; CGSRDLFormatNumber)
            {
                ApplicationArea = all;
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