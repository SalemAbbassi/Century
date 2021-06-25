tableextension 50212 TransferLine extends "Transfer Line"
{
    fields
    {
        modify("Item No.")
        {
            trigger OnAfterValidate()
            begin
                UpdateBin();
            end;
        }
        // Add changes to table fields here
        field(50200; ExtRef; text[50])
        {
            Caption = 'External Reference';
        }

        field(50210; SalesOrderNo; code[20])
        {
            Caption = 'Sales Order No.';
            trigger OnLookup()
            var
                recTransferHeader: Record "Transfer Header";
                recSalesHeader: Record "Sales Header";
                pagSalesOrderLst: Page "Sales Order List";
            begin
                Clear(pagSalesOrderLst);
                recTransferHeader.get(rec."Document No.");
                recSalesHeader.SetFilter("Document Type", '%1', recSalesHeader."Document Type"::Order);
                recSalesHeader.SetFilter("Bill-to Customer No.", '%1', recTransferHeader."Customer No.");
                pagSalesOrderLst.SetTableView(recSalesHeader);
                pagSalesOrderLst.LookupMode(true);
                if pagSalesOrderLst.RunModal() = Action::LookupOK then begin
                    pagSalesOrderLst.GetRecord(recSalesHeader);
                    SalesOrderNo := recSalesHeader."No.";

                end;
            end;

        }
        field(50211; SalesOrderLineNo; Integer)
        {
            Caption = 'Sales Order Line No.';
            trigger OnLookup()
            var
                recTransHeader: Record "Transfer Header";
                recSalesOrderLine: Record "Sales Line";
                pagSalesOrderLine: page "Sales Lines";
            begin
                if SalesOrderNo <> '' then begin
                    recTransHeader.Get("Document No.");
                    Clear(pagSalesOrderLine);
                    recSalesOrderLine.SetFilter("Document Type", '%1', recSalesOrderLine."Document Type"::Order);
                    recSalesOrderLine.SetFilter(type, '%1', recSalesOrderLine.Type::Item);
                    recSalesOrderLine.SetFilter("Document No.", '%1', SalesOrderNo);
                    recSalesOrderLine.SetFilter("Location Code", '%1', recTransHeader."Transfer-from Code");
                    pagSalesOrderLine.SetTableView(recSalesOrderLine);
                    pagSalesOrderLine.LookupMode(true);
                    if pagSalesOrderLine.RunModal() = action::LookupOK then begin
                        pagSalesOrderLine.GetRecord(recSalesOrderLine);
                        SalesOrderLineNo := recSalesOrderLine."Line No.";
                    end;
                end;
            end;
        }
    }

    var
        myInt: Integer;

    local procedure UpdateBin()
    var
        recTransferHeader: Record "Transfer Header";
    begin
        recTransferHeader.Get("Document No.");
        if (recTransferHeader."Transfer-from Code" = 'SD') and
            (recTransferHeader."Transfer-to Code" = 'SC') then
            validate("Transfer-To Bin Code", recTransferHeader."Customer No.");
        if (recTransferHeader."Transfer-from Code" = 'SC') and
            ((recTransferHeader."Transfer-to Code" = 'SD') OR (recTransferHeader."Transfer-to Code" = 'SRC')) then
            validate("Transfer-From Bin Code", recTransferHeader."Customer No.");

    end;
}