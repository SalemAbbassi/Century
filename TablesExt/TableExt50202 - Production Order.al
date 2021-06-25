tableextension 50202 "ProductionOrderExt" extends "Production Order"
{
    fields
    {
        field(50200; "Production Status"; option)
        {
            Caption = 'Production Status';
            OptionMembers = " ","T3";
            OptionCaption = ' ,T3';
        }
    }
}