pageextension 50202 OutputJournalExt extends "Output Journal"
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