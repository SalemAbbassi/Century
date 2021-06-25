tableextension 50210 TransferReceiptLine extends "Transfer Receipt Line"
{
    fields
    {
        field(50200; ExtRef; text[50])
        {
            Caption = 'External Reference';
        }
        field(50210; SalesOrderNo; code[20])
        {
            Caption = 'Sales Order No.';            
            trigger OnLookup()
            var
                recTranReceiptHeader : Record "Transfer Receipt Header";
                recSalesHeader : Record "Sales Header";  
                pagSalesOrderLst : Page "Sales Order List";
            begin
                Clear(pagSalesOrderLst);
                recTranReceiptHeader.get(rec."Document No.");
                recSalesHeader.SetFilter("Document Type",'%1',recSalesHeader."Document Type"::Order);
                recSalesHeader.SetFilter("Bill-to Customer No.",'%1',recTranReceiptHeader."Customer No.");
                pagSalesOrderLst.SetTableView(recSalesHeader);
                pagSalesOrderLst.LookupMode(true);
                if pagSalesOrderLst.RunModal() = Action::LookupOK then
                begin
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
                recSalesOrderLine : Record "Sales Line";
                pagSalesOrderLine : page "Sales Lines";
            begin
                if SalesOrderNo <> '' then
                begin                                    
                    Clear(pagSalesOrderLine);
                    recSalesOrderLine.SetFilter("Document Type",'%1',recSalesOrderLine."Document Type"::Order);
                    recSalesOrderLine.SetFilter(type,'%1',recSalesOrderLine.Type::Item);
                    recSalesOrderLine.SetFilter("Document No.",'%1',SalesOrderNo);
                    pagSalesOrderLine.SetTableView(recSalesOrderLine);
                    pagSalesOrderLine.LookupMode(true);
                    if pagSalesOrderLine.RunModal() = action::LookupOK then
                    begin
                        pagSalesOrderLine.GetRecord(recSalesOrderLine);
                        SalesOrderLineNo := recSalesOrderLine."Line No.";
                    end;
                end;
            end;           
        }
        field(50250; DBESubType; Option)
        {
            OptionMembers = " ","Consignment";
            OptionCaption = ' ,Consignement';
        }
        // Add changes to table fields here
    }
    
    var
        myInt: Integer;
}