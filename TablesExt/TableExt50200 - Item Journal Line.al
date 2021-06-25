tableextension 50200 ItemJournalLineExt extends "Item Journal Line"
{
    fields
    {
        field(50200; "Operator Code"; code[10])
        {
            Caption = 'Operator Code';
            TableRelation = "Salesperson/Purchaser";

        }
    }
}