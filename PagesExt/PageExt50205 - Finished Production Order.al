pageextension 50205 FinishedProductionOrderExt extends "Finished Production Order"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("Production Status"; "Production Status")
            {
                ApplicationArea = all;
            }
        }
    }
}