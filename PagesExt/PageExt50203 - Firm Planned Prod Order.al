pageextension 50203 FirmPlannedProdOrderExt extends "Firm Planned Prod. Order"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Production Status"; "Production Status")
            {
                ApplicationArea = all;
            }
        }
    }
}