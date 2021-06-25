page 50100 PostedReceiptLine
{
    Caption = 'PostedReceiptLine';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Transfer Receipt Line";
    Editable = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = All;
                    
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = all;
                }
                field("Item No.";"Item No.")
                {
                    ApplicationArea = all;
                }
                field(SalesOrderNo;SalesOrderNo)
                {
                    ApplicationArea = all;
                }
                field(SalesOrderLineNo;SalesOrderLineNo)
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
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}