tableextension 50206 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50200; ExtRef; text[50])
        {
            Caption = 'External Reference';
        }
        field(50250; DBESubType; Option)
        {
            OptionMembers = " ","Consignment";
            OptionCaption = ' ,Consignement';
        }
        field(50251; DBEAttach2TransOrder; Boolean)
        {
            Caption = 'Attach to Transfer Order';
        }

        modify("Location Code")
        {
            trigger OnAfterValidate()
            var
                recBin: Record Bin;
                recSalesHeader: Record "Sales Header";
            begin
                if (Type = type::Item) and ("Location Code" = 'SC') then
                    if recSalesHeader.get("Document Type", "Document No.") then
                        if recBin.Get("Location Code", recSalesHeader."Sell-to Customer No.") then
                            "Bin Code" := recBin.Code;

            end;
        }
        // Add changes to table fields here
    }
    trigger OnBeforeInsert()
    var
        myInt: Integer;
        recBin: Record Bin;
        recSalesHeader: Record "Sales Header";

    begin
        if (Type = type::Item) and ("Location Code" = 'SC') then
            if recSalesHeader.get("Document Type", "Document No.") then
                if recBin.Get("Location Code", recSalesHeader."Sell-to Customer No.") then
                    "Bin Code" := recBin.Code;
        if recSalesHeader.get("Document Type", "Document No.") then begin
            DBESubType := recSalesHeader.DBESubType;
        end;
    end;

    var
        myInt: Integer;
}