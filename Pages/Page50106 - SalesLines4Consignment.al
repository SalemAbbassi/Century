page 50106 SalesLine4Consignment
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Line";
    Editable = false;
    SourceTableView = WHERE("Document Type" = CONST(Order), DBESubType = const(Consignment), type = const(item), DBEAttach2TransOrder = const(false), "Location Code"= filter(<>'SC'));
    Caption = 'Sales Lines for Consignment';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
                field("Description 2"; "Description 2")
                {
                    ApplicationArea = fewer;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = all;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = all;
                }
                field("Qty. to Ship"; "Qty. to Ship")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {
            part(SalesLineFactBx; "Sales Line FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("Document No."), "Line No." = FIELD("Line No.");
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateTransferOrder)
            {
                Caption = 'Create Transfer Order';
                ApplicationArea = All;
                Image = TransferOrder;
                trigger OnAction();
                var
                    recSalesLines: Record "Sales Line";
                    recTransHeader : Record "Transfer Header";
                    cduConsignmentMgt: Codeunit ConsignmentMgt;
                    codTMP : Code[20];                    
                begin
                    CurrPage.SetSelectionFilter(recSalesLines);
                    codTMP := cduConsignmentMgt.CreateTransferOrder(recSalesLines);
                    CurrPage.Update(true);
                    Commit();
                    if codTMP <> '' then
                    begin
                        if Confirm(txt0001,true,recTransHeader.TableCaption,codTMP) then
                        begin
                            recTransHeader.SetFilter("No.",'%1',codTMP);
                            Page.RunModal(Page::"Transfer Order",recTransHeader);
                        end;
                    end;
                    
                end;
            }
        }
    }

    var
    txt0001 : Label 'Do you want to open %1 %2 ?';
}