pageextension 50201 ItemLedgerEntryExt extends "Item ledger entries"
{
    layout
    {
        addafter(Description)
        {
            field("Operator Code"; "Operator Code")
            {
                ApplicationArea = all;
            }
        }
    }
}