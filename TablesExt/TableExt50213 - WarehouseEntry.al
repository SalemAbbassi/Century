tableextension 50213 WarehouseEntry extends "Warehouse Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50200;DBESerialNo;code[20])
        {
            Caption = 'Serial No. From Item Entry';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula =Lookup("Item Ledger Entry"."Serial No." WHERE ("Document No."=FIELD("Reference No."),"Document Line No."=FIELD("Source Line No."),"Location Code"=CONST('SC'),"Item No."=FIELD("Item No.")));//FIELD("Whse. Document Line No."),"Location Code"=CONST('SC'),"Item No."=FIELD("Item No.")));
        }

    }
    
    var
        myInt: Integer;
}