report 50400 TestFormatAmt
{
    UsageCategory = Administration;
    ApplicationArea = All;


    WordLayout = 'TestFormatAmt.docx';
    Caption = 'Test Format Amt';
    DefaultLayout = Word;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                RequestFilterFields = "Currency Code";
                DataItemLink = "Customer No." = field("No.");
                DataItemLinkReference = customer;
                column(Amount; Amount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Remaining_Amount; "Remaining Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(decAmt; decAmt)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(decRAmt; decRAmt)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Currency_Code; "Currency Code")
                {

                }
                column(AmountTmp; rec21.Amount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Remaining_AmountTmp; rec21."Remaining Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    decAmt := Amount;
                    decRAmt := "Remaining Amount";
                    rec21.Amount := amount;
                    rec21."Remaining Amount" := "Remaining Amount";
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
        decAmt: Decimal;
        decRAmt: Decimal;
        rec21: Record "Cust. Ledger Entry" temporary;
}