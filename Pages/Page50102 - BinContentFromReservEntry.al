page 50102 BinContentFromReservEntry
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Reservation Entry";
    Editable = false;
    SourceTableView = where ("Source Type" = const (37));
    Caption = 'Bin Content Tracking';

    layout
    {
        area(Content)
        {            
            repeater(GroupName)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;

                }
                field(DBEBinCode;DBEBinCode)
                {
                    ApplicationArea = all;
                
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = all;
                }
                field(Quantity; abs(Quantity))
                {
                    ApplicationArea = all;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Source ID"; "Source ID")
                {
                    ApplicationArea = all;
                    Caption = 'Document No.';
                }
                field("Source Ref. No."; "Source Ref. No.")
                {
                    ApplicationArea = all;
                    Caption = 'Document Line No.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Navigation)
        {
            action(OpenDocument)
            {
                ApplicationArea = All;
                Caption = 'View Document';
                Image = View;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    recSalesHeader: Record "Sales Header";
                begin
                    recSalesHeader.SetFilter("Document Type", '%1', "Source Subtype");
                    recSalesHeader.SetFilter("No.", '%1', "Source ID");
                    case "Source Subtype" of
                        1:
                            Page.Run(page::"Sales Order", recSalesHeader);
                    end;

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetFilter("Location Code", '%1', 'SC');
    end;

    local procedure getBinCode(): code[20]
    var
        recSalesLines: Record "Sales Line";
    begin
        recSalesLines.SetFilter("Document Type", '%1', "Source Subtype");
        recSalesLines.SetFilter("Document No.", '%1', "Source ID");
        recSalesLines.SetFilter("Line No.", '%1', "Source Ref. No.");
        if recSalesLines.FindFirst() then
            exit(recSalesLines."Bin Code")
        else
            exit('');
    end;

    var
        txtBinCodeFilter : text;

}