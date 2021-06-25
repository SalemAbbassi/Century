tableextension 50201 ItemLedgerEntryExt extends "Item Ledger Entry"
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