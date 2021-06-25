codeunit 50200 "EventMgt"
{
    [EventSubscriber(ObjectType::Table, database::"Transfer Line", 'OnBeforeDeleteEvent', '', true, false)]
    local procedure OnBeforeDeleteTransLineExt(var Rec: Record "Transfer Line")
    var
        recSalesLine: Record "Sales Line";
    begin
        if recSalesLine.get(recSalesLine."Document Type"::Order, Rec.SalesOrderNo, Rec.SalesOrderLineNo) then begin
            recSalesLine.DBEAttach2TransOrder := false;
            recSalesLine.Modify(false);
        end;
    end;

    [EventSubscriber(ObjectType::Table, database::"Transfer Receipt Line", 'OnAfterCopyFromTransferLine', '', true, false)]
    local procedure OnAfterCopyFromTransferLineExt(TransferLine: Record "Transfer Line"; var TransferReceiptLine: Record "Transfer Receipt Line")
    begin
        TransferReceiptLine.SalesOrderNo := TransferLine.SalesOrderNo;
        TransferReceiptLine.SalesOrderLineNo := TransferLine.SalesOrderLineNo;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnAfterTransRcptLineModify', '', false, true)]
    local procedure OnAfterTransRcptLineModifyExt(TransferLine: Record "Transfer Line"; var TransferReceiptLine: Record "Transfer Receipt Line")
    var
        recSalesHeader: Record "Sales Header";
        recSalesLine: Record "Sales Line";
        recSalesLineNew: Record "Sales Line";
        recConsigSetup: Record DBEConsignmentSetup;
        recReserveEntrySource: Record "Reservation Entry";
        //recReserveEntrySource2: Record "Reservation Entry";
        recReserveEntrySource3: Record "Reservation Entry";
        recItemEntryRelation: Record "Item Entry Relation";
        recTransHeader: Record "Transfer Header";
        recBin: Record bin;
        TransferExtendedText: Codeunit "Transfer Extended Text";
        intLineNo: Integer;
    begin

        if recSalesLine.get(recSalesLine."Document Type"::Order, TransferLine.SalesOrderNo, TransferLine.SalesOrderLineNo) then begin
            recConsigSetup.Get();
            if recConsigSetup.CENTURYAutoConsignment then begin
                recConsigSetup.TestField(DBELocationTarget);
                recTransHeader.get(TransferLine."Document No.");
                if recTransHeader."Transfer-to Code" = recConsigSetup.DBELocationTarget then begin
                    if recSalesLine.Quantity = TransferLine."Qty. to Receive" then begin
                        recReserveEntrySource.Reset();
                        recReserveEntrySource.SetFilter("Source Type", '%1', Database::"Sales Line");
                        recReserveEntrySource.SetFilter("Source Subtype", '%1', recSalesLine."Document Type");
                        recReserveEntrySource.SetFilter("Source Ref. No.", '%1', recSalesLine."Line No.");
                        recReserveEntrySource.SetFilter("Source ID", '%1', recSalesLine."Document No.");
                        if recReserveEntrySource.FindSet() then
                            repeat
                                recReserveEntrySource."Location Code" := recConsigSetup.DBELocationTarget;
                                recReserveEntrySource.Modify(false);
                            until recReserveEntrySource.Next() = 0;

                        recSalesLine.SetHideValidationDialog(true);
                        recSalesLine.ExtRef := TransferReceiptLine."Document No.";
                        recSalesLine."Location Code" := recConsigSetup.DBELocationTarget;
                        recSalesHeader.get(recSalesLine."Document Type", recSalesLine."Document No.");
                        if recBin.Get(recSalesLine."Location Code", recSalesHeader."Sell-to Customer No.") then
                            recSalesLine."Bin Code" := recBin.Code;
                        recSalesLine.Modify(false);
                    end
                    else begin
                        recSalesLineNew.SetHideValidationDialog(true);
                        recSalesLineNew.reset;
                        recSalesLineNew.SetFilter("Document Type", '%1', recSalesLine."Document Type");
                        recSalesLineNew.SetFilter("Document No.", '%1', recSalesLine."Document No.");
                        if recSalesLineNew.FindLast() then
                            intLineNo := recSalesLineNew."Line No." + 10000
                        else
                            intLineNo := 10000;
                        recSalesLineNew.Init();
                        recSalesLineNew.SetHideValidationDialog(true);
                        recSalesLineNew.TransferFields(recSalesLine);
                        recSalesLineNew."Line No." := intLineNo;
                        recSalesLineNew.Insert(true);
                        recSalesLineNew.validate(Quantity, recSalesLine.Quantity - TransferLine."Qty. to Receive");
                        recSalesLineNew.DBEAttach2TransOrder := false;
                        recSalesLineNew.Modify(false);
                        IF TransferExtendedText.SalesCheckIfAnyExtText(recSalesLineNew, FALSE) then
                            TransferExtendedText.InsertSalesExtText(recSalesLineNew);

                        recItemEntryRelation.Reset();
                        recItemEntryRelation.SetFilter("Source Type", '%1', Database::"Transfer Receipt Line");
                        recItemEntryRelation.SetFilter("Source Subtype", '%1', 0);
                        recItemEntryRelation.SetFilter("Source Ref. No.", '%1', TransferReceiptLine."Line No.");
                        recItemEntryRelation.SetFilter("Source ID", '%1', TransferReceiptLine."Document No.");
                        /*
                        if recItemEntryRelation.findset then
                            repeat
                                if Confirm(recItemEntryRelation."Serial No.") then;
                            until recItemEntryRelation.Next() = 0;
                            */
                        /*
                        recReserveEntrySource2.SetFilter("Source Type", '%1', Database::"Transfer Line");
                        recReserveEntrySource2.SetFilter("Source Subtype", '%1', 0);
                        recReserveEntrySource2.SetFilter("Source Ref. No.", '%1', TransLine."Line No.");
                        recReserveEntrySource2.SetFilter("Source ID", '%1', TransLine."Document No.");
                        */
                        recReserveEntrySource.Reset();
                        recReserveEntrySource.SetFilter("Source Type", '%1', Database::"Sales Line");
                        recReserveEntrySource.SetFilter("Source Subtype", '%1', recSalesLine."Document Type");
                        recReserveEntrySource.SetFilter("Source Ref. No.", '%1', recSalesLine."Line No.");
                        recReserveEntrySource.SetFilter("Source ID", '%1', recSalesLine."Document No.");
                        if recReserveEntrySource.FindSet() then
                            repeat
                                recItemEntryRelation.SetRange("Serial No.", recReserveEntrySource."Serial No.");
                                recItemEntryRelation.SetRange("Lot No.", recReserveEntrySource."Lot No.");
                                if recItemEntryRelation.FindSet() then begin
                                    //if Confirm('transféré') then;
                                    recReserveEntrySource."Location Code" := recConsigSetup.DBELocationTarget;
                                    recReserveEntrySource.Modify(false);
                                end
                                else begin
                                    //if Confirm('split') then;
                                    recReserveEntrySource3.get(recReserveEntrySource."Entry No.", recReserveEntrySource.Positive);
                                    recReserveEntrySource3."Source Ref. No." := intLineNo;
                                    recReserveEntrySource3.Modify(false);
                                end;

                            until recReserveEntrySource.Next() = 0;
                        recSalesLine.SetHideValidationDialog(true);
                        recSalesLine.ExtRef := TransferReceiptLine."Document No.";
                        recSalesLine."Location Code" := recConsigSetup.DBELocationTarget;
                        recSalesHeader.get(recSalesLine."Document Type", recSalesLine."Document No.");
                        if recBin.Get(recSalesLine."Location Code", recSalesHeader."Sell-to Customer No.") then
                            recSalesLine."Bin Code" := recBin.Code;

                        recSalesLine.Quantity := TransferLine."Qty. to Receive";
                        recSalesLine."Quantity (Base)" := TransferLine."Qty. to Receive (Base)";

                        recSalesLine."Outstanding Quantity" := TransferLine."Qty. to Receive";
                        recSalesLine."Outstanding Qty. (Base)" := TransferLine."Qty. to Receive (Base)";

                        recSalesLine."Qty. to Invoice" := TransferLine."Qty. to Receive";
                        recSalesLine."Qty. to Invoice (Base)" := TransferLine."Qty. to Receive (Base)";

                        recSalesLine."Qty. to Ship" := TransferLine."Qty. to Receive";
                        recSalesLine."Qty. to Ship (Base)" := TransferLine."Qty. to Receive (Base)";
                        recSalesLine.Modify(false);

                    end;
                end
                else begin
                    if recSalesLine."Quantity" <> TransferLine."Qty. to Receive" then begin
                        recSalesLine.SetHideValidationDialog(true);

                        recSalesLine.Quantity := recSalesLine."Quantity" - TransferLine."Qty. to Receive";
                        recSalesLine."Quantity (Base)" := recSalesLine."Quantity (Base)" - TransferLine."Qty. to Receive (Base)";

                        recSalesLine."Outstanding Quantity" := recSalesLine."Quantity";
                        recSalesLine."Outstanding Qty. (Base)" := recSalesLine."Quantity (Base)";

                        recSalesLine."Qty. to Invoice" := recSalesLine."Quantity";
                        recSalesLine."Qty. to Invoice (Base)" := recSalesLine."Quantity (Base)";

                        recSalesLine."Qty. to Ship" := recSalesLine."Quantity";
                        recSalesLine."Qty. to Ship (Base)" := recSalesLine."Quantity (Base)";
                        recSalesLine.Modify(false);

                        recItemEntryRelation.Reset();
                        recItemEntryRelation.SetFilter("Source Type", '%1', Database::"Transfer Receipt Line");
                        recItemEntryRelation.SetFilter("Source Subtype", '%1', 0);
                        recItemEntryRelation.SetFilter("Source Ref. No.", '%1', TransferReceiptLine."Line No.");
                        recItemEntryRelation.SetFilter("Source ID", '%1', TransferReceiptLine."Document No.");
                        if recItemEntryRelation.FindSet() then
                            repeat
                                recReserveEntrySource.Reset();
                                recReserveEntrySource.SetFilter("Source Type", '%1', Database::"Sales Line");
                                recReserveEntrySource.SetFilter("Source Subtype", '%1', recSalesLine."Document Type");
                                recReserveEntrySource.SetFilter("Source Ref. No.", '%1', recSalesLine."Line No.");
                                recReserveEntrySource.SetFilter("Source ID", '%1', recSalesLine."Document No.");
                                recReserveEntrySource.setrange("Serial No.", recItemEntryRelation."Serial No.");
                                recReserveEntrySource.setrange("Lot No.", recItemEntryRelation."Lot No.");
                                if recReserveEntrySource.FindFirst() then
                                    recReserveEntrySource.DeleteAll(false);
                            until recItemEntryRelation.Next() = 0;
                    end;
                end;
            end;
        end;

    end;
    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnAfterInsertTransRcptLine', '', false, true)]
    local procedure OnAfterInsertTransRcptLineExt(TransLine: Record "Transfer Line"; var TransRcptLine: Record "Transfer Receipt Line")
    var
        recSalesLine: Record "Sales Line";
        recSalesLineNew: Record "Sales Line";
        recConsigSetup: Record DBEConsignmentSetup;
        recReserveEntrySource: Record "Reservation Entry";
        //recReserveEntrySource2: Record "Reservation Entry";
        recReserveEntrySource3: Record "Reservation Entry";
        recItemEntryRelation: Record "Item Entry Relation";
        TransferExtendedText: Codeunit "Transfer Extended Text";


        intLineNo: Integer;
    begin
        if recSalesLine.get(recSalesLine."Document Type"::Order, TransLine.SalesOrderNo, TransLine.SalesOrderLineNo) then begin
            recConsigSetup.Get();
            recConsigSetup.TestField(DBELocationTarget);
            if recSalesLine.Quantity = TransLine."Qty. to Receive" then begin
                recReserveEntrySource.SetFilter("Source Type", '%1', Database::"Sales Line");
                recReserveEntrySource.SetFilter("Source Subtype", '%1', recSalesLine."Document Type");
                recReserveEntrySource.SetFilter("Source Ref. No.", '%1', recSalesLine."Line No.");
                recReserveEntrySource.SetFilter("Source ID", '%1', recSalesLine."Document No.");
                if recReserveEntrySource.FindSet() then
                    repeat
                        recReserveEntrySource."Location Code" := recConsigSetup.DBELocationTarget;
                        recReserveEntrySource.Modify(false);
                    until recReserveEntrySource.Next() = 0;

                recSalesLine.SetHideValidationDialog(true);
                recSalesLine.ExtRef := TransRcptLine."Document No.";
                recSalesLine.Validate("Location Code", recConsigSetup.DBELocationTarget);
                recSalesLine.Modify(false);
            end
            else begin
                recSalesLineNew.SetHideValidationDialog(true);
                recSalesLineNew.reset;
                recSalesLineNew.SetFilter("Document Type", '%1', recSalesLine."Document Type");
                recSalesLineNew.SetFilter("Document No.", '%1', recSalesLine."Document No.");
                if recSalesLineNew.FindLast() then
                    intLineNo := recSalesLineNew."Line No." + 10000
                else
                    intLineNo := 10000;
                recSalesLineNew.Init();
                recSalesLineNew.SetHideValidationDialog(true);
                recSalesLineNew.TransferFields(recSalesLine);
                recSalesLineNew."Line No." := intLineNo;
                recSalesLineNew.Insert(true);
                recSalesLineNew.validate(Quantity, recSalesLine.Quantity - TransLine."Qty. to Receive");
                recSalesLineNew.DBEAttach2TransOrder := false;
                recSalesLineNew.Modify(false);
                IF TransferExtendedText.SalesCheckIfAnyExtText(recSalesLineNew, FALSE) then
                    TransferExtendedText.InsertSalesExtText(recSalesLineNew);

                recItemEntryRelation.SetFilter("Source Type", '%1', Database::"Transfer Receipt Line");
                recItemEntryRelation.SetFilter("Source Subtype", '%1', 0);
                recItemEntryRelation.SetFilter("Source Ref. No.", '%1', TransRcptLine."Line No.");
                recItemEntryRelation.SetFilter("Source ID", '%1', TransRcptLine."Document No.");
               
                recReserveEntrySource.SetFilter("Source Type", '%1', Database::"Sales Line");
                recReserveEntrySource.SetFilter("Source Subtype", '%1', recSalesLine."Document Type");
                recReserveEntrySource.SetFilter("Source Ref. No.", '%1', recSalesLine."Line No.");
                recReserveEntrySource.SetFilter("Source ID", '%1', recSalesLine."Document No.");
                if recReserveEntrySource.FindSet() then
                    repeat
                        recItemEntryRelation.SetRange("Serial No.", recReserveEntrySource."Serial No.");
                        recItemEntryRelation.SetRange("Lot No.", recReserveEntrySource."Lot No.");
                        if recItemEntryRelation.FindSet() then begin
                            recReserveEntrySource."Location Code" := recConsigSetup.DBELocationTarget;
                            recReserveEntrySource.Modify(false);
                        end
                        else begin
                            recReserveEntrySource3.get(recReserveEntrySource."Entry No.", recReserveEntrySource.Positive);
                            recReserveEntrySource3."Source Ref. No." := intLineNo;
                            recReserveEntrySource3.Modify(false);
                        end;

                    until recReserveEntrySource.Next() = 0;
                recSalesLine.SetHideValidationDialog(true);
                recSalesLine.ExtRef := TransRcptLine."Document No.";
                recSalesLine.Validate("Location Code", recConsigSetup.DBELocationTarget);
                recSalesLine.validate(Quantity, TransLine."Qty. to Receive");
                recSalesLine.Modify(false);

            end;
        end;


    end;
    */

    [EventSubscriber(ObjectType::Table, DATAbase::"Sales Line", 'OnBeforeInsertEvent', '', true, false)]
    local procedure SalesLineOnBeforeInsertEvent(var Rec: Record "Sales Line")
    var
        rec36: Record "Sales Header";
    begin
        if rec36.Get(Rec."Document Type", Rec."Document No.") then
            Rec.DBESubType := rec36.DBESubType;

    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Line", 'OnBeforeModifyEvent', '', true, false)]
    local procedure SalesLineOnBeforeModifyEvent(var Rec: Record "Sales Line")
    var
        rec36: Record "Sales Header";
    begin
        if rec36.Get(Rec."Document Type", Rec."Document No.") then
            Rec.DBESubType := rec36.DBESubType;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]

    local procedure ItemJnlPostLine_OnBeforeInsertItemLedgEntry(ItemJournalLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry."Operator Code" := ItemJournalLine."Operator Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnBeforeTransRcptHeaderInsert', '', False, False)]
    local procedure TransfertRcptHeader_OnBeforeTransRcptHeaderInsert(VAR TransferReceiptHeader: Record "Transfer Receipt Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferReceiptHeader."Customer No." := TransferHeader."Customer No.";
    end;

    [EventSubscriber(ObjectType::table, database::"Transfer Shipment Line", 'OnAfterCopyFromTransferLine', '', false, false)]
    local procedure OnAfterCopyFromTransferLineShpExt(TransferLine: Record "Transfer Line"; var TransferShipmentLine: Record "Transfer Shipment Line")
    begin
        TransferShipmentLine.SalesOrderNo := TransferLine.SalesOrderNo;
        TransferShipmentLine.SalesOrderLineNo := TransferLine.SalesOrderLineNo;
    end;

    [EventSubscriber(ObjectType::table, database::"Transfer Receipt Line", 'OnAfterCopyFromTransferLine', '', false, false)]
    local procedure OnAfterCopyFromTransferLineRcptExt(TransferLine: Record "Transfer Line"; var TransferReceiptLine: Record "Transfer Receipt Line")
    begin
        TransferReceiptLine.SalesOrderNo := TransferLine.SalesOrderNo;
        TransferReceiptLine.SalesOrderLineNo := TransferLine.SalesOrderLineNo;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeConfirmPost', '', false, false)]
    local procedure OnBeforeConfirmPostExt(var HideDialog: Boolean; var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header")
    var
        Selection: Integer;
        ReceiveInvoiceQst: label '&Receive,&Invoice,Receive &and Invoice';
        PostConfirmQst: label 'Do you want to post the %1?';
        ShipInvoiceQst: label '&Ship,&Invoice,Ship &and Invoice';
        NothingToPostErr: label 'There is nothing to post.';
    begin
        WITH PurchaseHeader DO BEGIN
            CASE "Document Type" OF
                "Document Type"::Order:
                    BEGIN
                        Selection := STRMENU(ReceiveInvoiceQst, 1);
                        IF Selection = 0 THEN
                            IsHandled := true;
                        Receive := Selection IN [1, 3];
                        Invoice := Selection IN [2, 3];
                    END;
                "Document Type"::"Return Order":
                    BEGIN
                        Selection := STRMENU(ShipInvoiceQst, 3);
                        IF Selection = 0 THEN
                            IsHandled := true;
                        Ship := Selection IN [1, 3];
                        Invoice := Selection IN [2, 3];
                    END
                ELSE
                    IF NOT CONFIRM(PostConfirmQst, FALSE, FORMAT("Document Type")) THEN
                        IsHandled := true;
            END;
            "Print Posted Documents" := FALSE;
        END;
        HideDialog := not IsHandled;
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Shipment Line", 'OnBeforeInsertInvLineFromShptLineBeforeInsertTextLine', '', false, false)]
    local procedure OnBeforeInsertInvLineFromShptLineBeforeInsertTextLineExt(var SalesLine: Record "Sales Line"; var SalesShptLine: Record "Sales Shipment Line"; var Handled: Boolean)
    var
        Text92000: Label 'Sales Order No. %1 of %2:';
        SalesShptHeader: Record "Sales Shipment Header";
    begin
        Handled := true;
        //SalesShptHeader.get(SalesShptLine."Document No.");
        //SalesLine.Description := STRSUBSTNO(Text92000, SalesShptLine."Order No.",SalesShptHeader."Shipment Date");

    end;

    [EventSubscriber(ObjectType::Page, Page::"General Ledger Entries", 'OnOpenPageEvent', '', false, false)]
    local procedure MyProcedure()
    begin

    end;
}