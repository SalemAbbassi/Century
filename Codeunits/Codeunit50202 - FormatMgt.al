codeunit 50202 DBEFormatMgt
{
    procedure getRDLFormatDecimalPlace(CodCurrency: code[10]; intFormatType: Integer): Text
    var
        recCurrency: Record Currency;

    begin
        if not recCurrency.Get(CodCurrency) then
            exit('F2');

        case intFormatType of
            1:
                begin
                    exit('F' + format(recCurrency."Amount Decimal Places"[StrLen(recCurrency."Amount Decimal Places")]));
                end;
            2:
                begin
                    exit('F' + format(recCurrency."Unit-Amount Decimal Places"[StrLen(recCurrency."Unit-Amount Decimal Places")]));
                end;
        end;
    end;

    procedure getRDLFormatDecimalPlace(CodCurrency: code[10]): Text
    var
        recCurrency: Record Currency;

    begin
        if not recCurrency.Get(CodCurrency) then
            exit('#,0.00;(#,0.00)');
        if recCurrency.CGSRDLFormatNumber = '' then
            exit('#,0.00;(#,0.00)');
        exit(recCurrency.CGSRDLFormatNumber);
    end;

    procedure getRDLLangueCode(CodCurrency: code[10]): Text
    var
        recCurrency: Record Currency;
        recGenLedSetup: Record "General Ledger Setup";
    begin
        if CodCurrency = '' then begin
            recGenLedSetup.Get();
            CodCurrency := recGenLedSetup."LCY Code";
        end;

        if not recCurrency.Get(CodCurrency) then
            exit('en-US');

        if recCurrency.CGSLangCode = '' then
            exit('en-US');

        exit(recCurrency.CGSLangCode);

    end;

    var
        myInt: Integer;
}