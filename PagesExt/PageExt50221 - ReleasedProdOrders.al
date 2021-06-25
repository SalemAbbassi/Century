pageextension 50221 ReleasedProdOrders extends "Released Production Orders"
{
    layout
    {
        // Add changes to page layout here
        modify("No.")
        {
            StyleExpr = txtLineStyle;
        }
        modify(Description)
        {
            StyleExpr = txtLineStyle;
        }
    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        txtLineStyle: Text;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        SetStyle();
    end;

    local procedure SetStyle()
    var
        recPurchLine: Record "Purchase Line";
        recProdOrderLine: Record "Prod. Order Line";
    begin
        recProdOrderLine.SetFilter("Prod. Order No.", '%1', "No.");
        if recProdOrderLine.FindSet() then begin

            recPurchLine.SETCURRENTKEY(
                "Document Type", Type, "Prod. Order No.", "Prod. Order Line No.", "Routing No.", "Operation No.");
            recPurchLine.SETRANGE("Document Type", recPurchLine."Document Type"::Order);
            recPurchLine.SETRANGE("Prod. Order No.", "No.");
            recPurchLine.SETRANGE(Type, recPurchLine.Type::Item);
            recPurchLine.SETRANGE("No.", recProdOrderLine."Item No.");
            //recPurchLine.SETRANGE("Routing No.", recProdOrderLine."Routing No.");
            //recPurchLine.SETRANGE("Operation No.", recProdOrderLine."Operation No.");
            IF NOT recPurchLine.FINDFIRST THEN
                txtLineStyle := 'Standard'
            else
                txtLineStyle := 'StrongAccent';//Favorable
        end
        else
            txtLineStyle := 'Standard'

    end;
    /*
        Value	        Format
        Standard	    Standard
        StandardAccent	Blue
        Strong	        Bold
        StrongAccent	Blue + Bold
        Attention	    Red + Italic
        AttentionAccent	Blue + Italic
        Favorable	    Bold + Green
        Unfavorable	    Bold + Italic + Red
        Ambiguous	    Yellow
        Subordinate	    Grey
    */

}