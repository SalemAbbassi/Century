tableextension 50214 ReservationEntry extends "Reservation Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50200; DBEBinCode; Code[20])
        {
            Editable = false;
            Caption = 'Bin Code';
            FieldClass = FlowField;
            CalcFormula = lookup ("Sales Line"."Bin Code" where ("Document No." = field ("Source ID"), "Line No." = field ("Source Ref. No."), "Document Type" = field ("Source Subtype")));
        }
    }

    var
        myInt: Integer;
}