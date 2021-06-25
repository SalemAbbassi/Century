pageextension 50220 SalesOrder extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
        addafter("Sell-to Customer Name")
        {
            field("Sell-to Customer Name 2"; "Sell-to Customer Name 2")
            {
                ApplicationArea = all;
            }
        }
        addafter("Bill-to Name")
        {
            field("Bill-to Name 2"; "Bill-to Name 2")
            {
                ApplicationArea = all;
            }
        }
        addafter("Ship-to Name")
        {
            field("Ship-to Name 2"; "Ship-to Name 2")
            {
                ApplicationArea = all;
            }
        }
        addafter(Status)
        {
            field("Customer Price Group"; "Customer Price Group")
            {
                ApplicationArea = all;
            }
        }
        addafter("Direct Debit Mandate ID")
        {
            field("Transport Method 2"; "Transport Method")
            {
                ApplicationArea = all;
                Visible = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addfirst(Processing)
        {
            Group(ConsignmentGrp)
            {
                Caption = 'Consignment';
                Image = TransferOrder;
                action(SalesLines)
                {
                    ApplicationArea = all;
                    Caption = 'Sales Lines to Transfer';
                    Image = SelectEntries;
                    Promoted = true;
                    trigger OnAction()
                    var
                        recSalesLine: Record "Sales Line";
                        pagSalesLineConsig: Page SalesLine4Consignment;
                    begin
                        recSalesLine.SetFilter("Sell-to Customer No.", '%1', "Sell-to Customer No.");
                        pagSalesLineConsig.SetRecord(recSalesLine);
                        pagSalesLineConsig.RunModal();

                    end;
                }
            }
        }
    }
}