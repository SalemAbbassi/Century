pageextension 50200 ProductionJournalExt extends "Production Journal"
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