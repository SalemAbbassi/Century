page 50490 SalesDocumentMgt
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(SheetName; txtSheetName)
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                Caption = 'Import Sales Order Excel File';
                ApplicationArea = All;

                trigger OnAction()
                var
                    cduDocMgt: Codeunit SalesDocumentMgt;
                begin
                    clear(cduDocMgt);
                    if cduDocMgt.OpenExcelFile(txtSheetName) then//'41110909') then
                    begin
                        cduDocMgt.createSalesDocument(1);
                        Message('ok');
                    end;

                end;
            }
            action(ActionImpItmJnl)
            {
                Caption = 'Import Itemp Jnl Excel File';
                ApplicationArea = All;

                trigger OnAction()
                var
                    cduDocMgt: Codeunit SalesDocumentMgt;
                begin
                    clear(cduDocMgt);
                    if cduDocMgt.OpenExcelFile(txtSheetName) then//'Feuil1') then                    
                    begin
                        cduDocMgt.createItemJnlLine(2, 'ARTICLE', 'REPRISE');
                        Message('ok');
                    end;

                end;
            }
            /*
            action(test)
            {
                ApplicationArea = All;
                Caption = 'test';
                trigger OnAction()
                begin
                    MESSAGE('%1', FORMAT(10.0, 0, '<Precision,0:0><Standard Format,2>'));
                end;
            }
            action(delSalesPrice)
            {
                ApplicationArea = All;
                Caption = 'Delete Sales Prices R_JPY';
                trigger OnAction()
                var
                    rec7002: Record "Sales Price";
                begin
                    rec7002.reset;
                    rec7002.setfilter("Sales Code", '%1', 'R_JPY');
                    if rec7002.FindSet() then
                        rec7002.DeleteAll();
                    Message('ok');
                end;
            }
            action(UpdateCustCentury)
            {
                ApplicationArea = all;
                Caption = 'Update Countru Cust';
                trigger OnAction()
                var
                    recCust: Record Customer;
                    recSalesheader: Record "Sales Header";
                begin
                    recCust.reset;
                    repeat
                        if copystr(recCust."No.", 1, 3) = 'C41' then begin
                            recCust."Country/Region Code" := 'CH';
                            recCust.modify(false);
                        end;
                    until recCust.Next() = 0;

                    recSalesheader.reset;
                    repeat
                        if copystr(recSalesheader."Sell-to Customer No.", 1, 3) = 'C41' then begin
                            recSalesheader."Sell-to Country/Region Code" := 'CH';
                            if recSalesheader."Bill-to Country/Region Code" = '' then
                                recSalesheader."Bill-to Country/Region Code" := 'CH';
                            if recSalesheader."Ship-to Country/Region Code" = '' then
                                recSalesheader."Ship-to Country/Region Code" := 'CH';
                            recSalesheader.modify(false);
                        end;
                    until recSalesheader.Next() = 0;
                    Message('ok');
                end;
            }
            action(UpdateExtText)
            {
                ApplicationArea = all;
                Caption = 'Update ext Txt';
                trigger OnAction()
                var
                    recExtH: Record "Extended Text Header";
                    recExtLine: Record "Extended Text Line";
                    recExtLineNew: Record "Extended Text Line";
                begin
                    recExtH.reset;
                    if recExtH.FindSet() then
                        repeat
                            recExtLine.reset;
                            recExtLine.SetFilter("Table Name", '%1', recExtH."Table Name");
                            recExtLine.SetFilter("No.", '%1', recExtH."No.");
                            recExtLine.SetFilter("Language Code", '%1', recExtH."Language Code");
                            recExtLine.SetFilter("Text No.", '%1', recExtH."Text No.");
                            if recExtLine.FindLast() and (recExtLine.Count() = 1) then begin
                                recExtLineNew.init;
                                recExtLineNew.TransferFields(recExtLine);
                                recExtLineNew."Line No." := recExtLineNew."Line No." + 10000;
                                recExtLineNew.Text := ' ';
                                recExtLineNew.Insert(true);
                            end;
                        until recExtH.Next() = 0;
                    Message('ok');
                end;
            }
            */
        }
    }

    var
        myInt: Integer;
        txtSheetName: Text;
}