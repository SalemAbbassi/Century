pageextension 50204 ReleasedProductionOrderExt extends "Released Production Order"
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