pageextension 50206 TransfertOrderExt extends "Transfer Order"
{
    layout
    {
        addbefore("Transfer-from Code")
        {
            field("Customer No."; "Customer No.")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        addlast("O&rder")
        {
            action(GetOrder4ReturnCons)
            {
                Caption = 'Get Orders for Return Consignment';
                ApplicationArea = all;
                Promoted = true;
                Ellipsis = true;
                Image = GetOrder;
                trigger OnAction()
                var
                    pagSalesOrderConsig: Page DBESalesOrderConsignmentList;//DBESalesOrderConsignment;
                    recSalesOrder: Record "Sales Header";
                    cduConsgMgt: Codeunit ConsignmentMgt;
                begin
                    recSalesOrder.SetFilter("Sell-to Customer No.", '%1', "Customer No.");
                    recSalesOrder.SetFilter("Document Type", '%1', recSalesOrder."Document Type"::Order);
                    recSalesOrder.SetFilter(DBESubType, '%1', recSalesOrder.DBESubType::Consignment);

                    pagSalesOrderConsig.LookupMode := true;
                    pagSalesOrderConsig.SetRecord(recSalesOrder);
                    pagSalesOrderConsig.SetTableView(recSalesOrder);
                    if pagSalesOrderConsig.RunModal() = Action::LookupOK then begin
                        pagSalesOrderConsig.GetRecord(recSalesOrder);
                        cduConsgMgt.GetConsOrder4TransferOrder(recSalesOrder, Rec);
                    end;

                end;

            }
        }
        addafter(PostAndPrint)
        {
            action(GlobalPost)
            {
                Caption = 'Post Global';
                ApplicationArea = all;
                PromotedIsBig = true;
                Promoted = true;
                Ellipsis = true;
                Image = PostedShipment;
                trigger OnAction()
                var
                    cduConsigMgt: Codeunit ConsignmentMgt;
                begin
                    cduConsigMgt.PostGlobal(rec, false);
                end;
            }
            action(GlobalPostAndPrint)
            {
                Caption = 'Post and Print Global';
                ApplicationArea = all;
                PromotedIsBig = true;
                Promoted = true;
                Ellipsis = true;
                Image = PostedShipment;
                trigger OnAction()
                var
                    cduConsigMgt: Codeunit ConsignmentMgt;
                begin
                    cduConsigMgt.PostGlobal(rec, true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}