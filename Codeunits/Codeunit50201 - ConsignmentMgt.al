codeunit 50201 ConsignmentMgt
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure PostGlobal(var recTransHeader: Record "Transfer Header"; booPrint: boolean)
    var
        GetSourceDocInBound: Codeunit "Get Source Doc. Inbound";
        GetSourceDocOutBound: Codeunit "Get Source Doc. Outbound";
        TransferPostShipment: Codeunit "TransferOrder-Post Shipment";
        TransferPostReceipt: Codeunit "TransferOrder-Post Receipt";
        WhsePostReceipt: Codeunit "Whse.-Post Receipt";
        WhsePostShipment: Codeunit "Whse.-Post Shipment";
        WhsePostReceiptPrint: Codeunit "Whse.-Post Receipt + Print";
        RealseTransferDoc: Codeunit "Release Transfer Document";
        releaseSalesDoc: Codeunit "Release Sales Document";


        recTransLine: Record "Transfer Line";
        recWhseRcptLine: Record "Warehouse Receipt Line";
        recWhseShpLine: Record "Warehouse Shipment Line";
        recSalesHeader: Record "Sales Header";
        recSalesLine: Record "Sales Line";
        recSalesLineTMP: Record "Sales Line" temporary;
        recReserveEntry: Record "Reservation Entry";
        TransferReceiptHeader: record "Transfer Receipt Header";
        TransferShipHeader: Record "Transfer Shipment Header";
        lblConfirm: Label 'Do you want to post to Shipment and Warehouse receipt and receipt for %1 %2 ?';

    begin
        recTransLine.SetFilter("Document No.", '%1', recTransHeader."No.");
        if recTransLine.FindSet() then
            repeat
                recTransLine.TestField(SalesOrderLineNo);
                recTransLine.TestField(SalesOrderNo);
            until recTransLine.Next() = 0;

        if Confirm(lblConfirm, false, recTransHeader.TableCaption, recTransHeader."No.") then begin
            if recTransHeader."Transfer-from Code" = 'SC' then begin
                clear(recSalesLineTMP);
                recSalesLine.reset;
                recTransLine.setfilter("Document No.", '%1', recTransHeader."No.");
                if recTransLine.FindSet() then
                    repeat
                        if recSalesLine.get(recSalesLine."Document Type"::Order, recTransLine.SalesOrderNo, recTransLine.SalesOrderLineNo) and
                           (recSalesLine.Quantity = recTransLine."Quantity (Base)") then begin
                            recSalesLineTMP.TransferFields(recSalesLine);
                            recSalesLineTMP.Insert(false);
                            //recSalesLine.SetHideValidationDialog(true);
                            //recSalesLine.Delete(true);
                        end;
                    until recTransLine.Next() = 0;

                RealseTransferDoc.Run(recTransHeader);
                GetSourceDocOutBound.CreateFromOutbndTransferOrderHideDialog(recTransHeader);
                recWhseShpLine.Reset();
                recWhseShpLine.SetFilter("Source Type", '%1', 5741);
                recWhseShpLine.SetFilter("Source Subtype", '%1', 0);
                recWhseShpLine.SetFilter("Source No.", '%1', recTransHeader."No.");
                if recWhseShpLine.FindSet() then begin
                    //if booPrint then
                    //   WhsePostShipment.SetPrint(true);
                    WhsePostShipment.RUN(recWhseShpLine);
                end;

                if booPrint then begin
                    TransferShipHeader.Reset();
                    TransferShipHeader.SetFilter("Transfer Order No.", '%1', recTransHeader."No.");
                    if TransferShipHeader.FindLast() then
                        PrintReport(TransferShipHeader."No.", 1);
                end;
                //Commit();
                TransferPostReceipt.RUN(recTransHeader);



                recSalesLine.reset;
                if recSalesLineTMP.FindSet() then begin
                    if recSalesHeader.get(recSalesLineTMP."Document Type", recSalesLineTMP."Document No.") then begin
                        releaseSalesDoc.Reopen(recSalesHeader);
                    end;
                    repeat
                        if recSalesLine.get(recSalesLine."Document Type"::Order, recSalesLineTMP."Document No.", recSalesLineTMP."Line No.") then begin
                            recReserveEntry.Reset();
                            recReserveEntry.SetFilter("Source Type", '%1', Database::"Sales Line");
                            recReserveEntry.SetFilter("Source Subtype", '%1', recSalesLine."Document Type");
                            recReserveEntry.SetFilter("Source Ref. No.", '%1', recSalesLine."Line No.");
                            recReserveEntry.SetFilter("Source ID", '%1', recSalesLine."Document No.");
                            recReserveEntry.DeleteAll(false);
                            recSalesLine.SetHideValidationDialog(true);
                            recSalesLine.Delete(true);
                        end;
                    until recSalesLineTMP.Next() = 0;

                    recSalesLineTMP.FindFirst();
                    repeat
                        recSalesLine.SetFilter("Document Type", '%1', recSalesLineTMP."Document Type");
                        recSalesLine.SetFilter("Document No.", '%1', recSalesLineTMP."Document No.");
                        recSalesLine.SetFilter("Outstanding Quantity", '>%1', 0);
                        if recSalesLine.IsEmpty then
                            if recSalesHeader.get(recSalesLineTMP."Document Type", recSalesLineTMP."Document No.") then begin

                                recSalesHeader.SetHideValidationDialog(true);
                                recSalesHeader.Delete(true);
                            end;
                    until recSalesLineTMP.Next() = 0;
                end;

                //if booPrint then
                //    PrintReport(recTransHeader, 2);

            end
            else begin

                TransferPostShipment.RUN(recTransHeader);
                //commit();
                GetSourceDocInBound.CreateFromInbndTransferOrderHideDialog(recTransHeader);
                //Commit();
                recWhseRcptLine.Reset();
                recWhseRcptLine.SetFilter("Source Type", '%1', 5741);
                recWhseRcptLine.SetFilter("Source Subtype", '%1', 1);
                recWhseRcptLine.SetFilter("Source No.", '%1', recTransHeader."No.");
                if recWhseRcptLine.FindSet() then begin
                    //if booPrint then
                    //    WhsePostReceiptPrint.Run(recWhseRcptLine)
                    //else
                    WhsePostReceipt.RUN(recWhseRcptLine);
                end;
                if booPrint then begin
                    TransferReceiptHeader.Reset();
                    TransferReceiptHeader.SetFilter("Transfer Order No.", '%1', recTransHeader."No.");
                    if TransferReceiptHeader.FindLast() then
                        PrintReport(TransferReceiptHeader."No.", 2);
                end;
            end;
            //CODEUNIT.RUN(CODEUNIT::"Whse.-Post Receipt (Yes/No)",WhseRcptLine);
            //TransferPostReceipt.RUN(recTransHeader);

        end;

    end;

    procedure PrintReport(codDocNo: code[20]; Selection: Option ,Shipment,Receipt)
    begin

        CASE Selection OF
            Selection::Shipment:
                PrintShipment(codDocNo);
            Selection::Receipt:
                PrintReceipt(codDocNo);
        END;
    end;

    procedure PrintReport(TransHeaderSource: Record "Transfer Header"; Selection: Option ,Shipment,Receipt)
    begin
        WITH TransHeaderSource DO
            CASE Selection OF
                Selection::Shipment:
                    PrintShipment("Last Shipment No.");
                Selection::Receipt:
                    PrintReceipt("Last Receipt No.");
            END;
    end;

    procedure PrintReceipt(DocNo: Code[20])
    var
        TransRcptHeader: Record "Transfer Receipt Header";
    begin

        IF TransRcptHeader.GET(DocNo) THEN BEGIN
            TransRcptHeader.SETRECFILTER;
            TransRcptHeader.PrintRecords(true);
        END;
    end;

    procedure PrintShipment(DocNo: Code[20])
    var
        TransShipHeader: Record "Transfer Shipment Header";
    begin

        IF TransShipHeader.GET(DocNo) THEN BEGIN
            TransShipHeader.SETRECFILTER;
            TransShipHeader.PrintRecords(true);
        END;
    end;

    procedure CreateTransferOrder(var recSalesLines: Record "Sales Line"): code[20]
    var
        recSalesHeader: Record "Sales Header";
        recTransHeader: Record "Transfer Header";
        recTransferLine: Record "Transfer Line";
        recReserveEntrySource: Record "Reservation Entry";
        recReserveEntryDest: Record "Reservation Entry";
        recConsignmentSetup: Record DBEConsignmentSetup;

        pagTransferOrder: page "Transfer Order";
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";

        intLineNo: Integer;
    begin

        if recSalesLines.FindSet() then begin
            recConsignmentSetup.Get();
            recConsignmentSetup.TestField(DBELocationSource);
            recConsignmentSetup.TestField(DBELocationTarget);
            recConsignmentSetup.TestField(DBELocationTransit);

            recTransHeader.Init();
            recTransHeader.Validate("Customer No.", recSalesLines."Sell-to Customer No.");
            recTransHeader.Validate("Transfer-from Code", recConsignmentSetup.DBELocationSource);
            recTransHeader.Validate("Transfer-to Code", recConsignmentSetup.DBELocationTarget);
            recTransHeader.Validate("In-Transit Code", recConsignmentSetup.DBELocationTransit);
            recTransHeader.Insert(true);

            intLineNo := 10000;
            repeat
                recTransferLine.Init();
                recTransferLine.validate("Document No.", recTransHeader."No.");
                recTransferLine.validate("Line No.", intLineNo);
                recTransferLine.Insert(true);

                recTransferLine.Validate("Item No.", recSalesLines."No.");
                recTransferLine.Validate(Quantity, recSalesLines."Outstanding Quantity");
                recTransferLine.Validate(SalesOrderNo, recSalesLines."Document No.");
                recTransferLine.Validate(SalesOrderLineNo, recSalesLines."Line No.");
                recTransferLine.Modify(true);

                recReserveEntrySource.SetFilter("Source Type", '%1', Database::"Sales Line");
                recReserveEntrySource.SetFilter("Source Subtype", '%1', recSalesLines."Document Type");
                recReserveEntrySource.SetFilter("Source Ref. No.", '%1', recSalesLines."Line No.");
                recReserveEntrySource.SetFilter("Source ID", '%1', recSalesLines."Document No.");
                //recReserveEntrySource.SetFilter("Source Prod. Order Line", '%1', recSalesLines."Line No.");
                if recReserveEntrySource.FindSet() then
                    repeat
                        cduCreateReservEntry.CreateReservEntryFor(
                                DATABASE::"Transfer Line",
                                0,
                                recTransHeader."No.",
                                '',
                                0,
                                intLineNo,//"Source Line No.",
                                recReserveEntrySource."Qty. per Unit of Measure",//"Qty. per Unit of Measure",
                                abs(recReserveEntrySource.Quantity),
                                abs(recReserveEntrySource."Quantity (Base)"),
                                recReserveEntrySource."Serial No.",//SerieNo,
                                recReserveEntrySource."Lot No.");

                        cduCreateReservEntry.CreateEntry(
                            recTransferLine."Item No.",//"Item No.",
                            '',
                            recTransferLine."Transfer-from Code",//"Location Code",
                            '',//''Description,
                            recTransHeader."Receipt Date",
                            recTransHeader."Shipment Date",//"Shipment Date",
                            0,
                            2);

                        cduCreateReservEntry.CreateReservEntryFor(
                            DATABASE::"Transfer Line",
                            1,
                            recTransHeader."No.",
                            '',
                            0,
                            intLineNo,//"Source Line No.",
                            recReserveEntrySource."Qty. per Unit of Measure",//"Qty. per Unit of Measure",
                            abs(recReserveEntrySource.Quantity),
                            abs(recReserveEntrySource."Quantity (Base)"),
                            recReserveEntrySource."Serial No.",//SerieNo,
                            recReserveEntrySource."Lot No.");

                        cduCreateReservEntry.CreateEntry(
                            recTransferLine."Item No.",//"Item No.",
                            '',
                            recTransferLine."Transfer-to Code",//"Location Code",
                            '',//''Description,
                            recTransHeader."Receipt Date",
                            recTransHeader."Shipment Date",//"Shipment Date",
                            0,
                            2);
                    until recReserveEntrySource.Next() = 0;
                recSalesHeader.Get(recSalesLines."Document Type", recSalesLines."Document No.");
                recSalesHeader.SetHideValidationDialog(true);
                recSalesHeader."External Document No." := 'KONSIGNATION';
                recSalesHeader.Modify(false);
                intLineNo += 10000;
            until recSalesLines.Next() = 0;
            recSalesLines.ModifyAll(DBEAttach2TransOrder, true, false);
            exit(recTransHeader."No.");
        end
        else
            exit('');
    end;

    procedure GetConsOrder4TransferOrder(var recSalesOrder: Record "Sales Header"; var recTransHeader: Record "Transfer Header")
    var
        recSalesHeader: Record "Sales Header";
        recSalesLine: Record "Sales Line";
        recTransferLine: Record "Transfer Line";
        recReserveEntrySource: Record "Reservation Entry";
        recReserveEntryDest: Record "Reservation Entry";
        recConsignmentSetup: Record DBEConsignmentSetup;

        pagTransferOrder: page "Transfer Order";
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";

        intLineNo: Integer;
        err001: Label 'There is no consignment Lines on %1 %2';
    begin
        recConsignmentSetup.Get();
        recConsignmentSetup.TestField(DBELocationSource);
        recConsignmentSetup.TestField(DBELocationTarget);
        recConsignmentSetup.TestField(DBELocationTransit);

        recSalesLine.SetFilter("Document Type", '%1', recSalesOrder."Document Type");
        recSalesLine.SetFilter("Document No.", '%1', recSalesOrder."No.");
        recSalesLine.SetFilter("Location Code", '%1', recConsignmentSetup.DBELocationTarget);
        recSalesLine.SetFilter("Outstanding Quantity", '>%1', 0);
        if recSalesLine.IsEmpty then
            Error(err001, Format(recSalesOrder."Document Type"), recSalesOrder."No.");

        if recSalesLine.FindSet() then begin
            recTransferLine.setfilter("Document No.", '%1', recTransHeader."No.");
            if recTransferLine.FindLast() then
                intLineNo := recTransferLine."Line No." + 10000
            else
                intLineNo := 10000;
            repeat
                recTransferLine.Init();
                recTransferLine.validate("Document No.", recTransHeader."No.");
                recTransferLine.validate("Line No.", intLineNo);
                recTransferLine.Insert(true);

                recTransferLine.Validate("Item No.", recSalesLine."No.");
                recTransferLine.Validate(Quantity, recSalesLine."Outstanding Quantity");
                recTransferLine.Validate(SalesOrderNo, recSalesLine."Document No.");
                recTransferLine.Validate(SalesOrderLineNo, recSalesLine."Line No.");
                recTransferLine.Modify(true);

                recReserveEntrySource.SetFilter("Source Type", '%1', Database::"Sales Line");
                recReserveEntrySource.SetFilter("Source Subtype", '%1', recSalesLine."Document Type");
                recReserveEntrySource.SetFilter("Source Ref. No.", '%1', recSalesLine."Line No.");
                recReserveEntrySource.SetFilter("Source ID", '%1', recSalesLine."Document No.");
                //recReserveEntrySource.SetFilter("Source Prod. Order Line", '%1', recSalesLines."Line No.");
                if recReserveEntrySource.FindSet() then
                    repeat
                        cduCreateReservEntry.CreateReservEntryFor(
                                DATABASE::"Transfer Line",
                                0,
                                recTransHeader."No.",
                                '',
                                0,
                                intLineNo,//"Source Line No.",
                                recReserveEntrySource."Qty. per Unit of Measure",//"Qty. per Unit of Measure",
                                abs(recReserveEntrySource.Quantity),
                                abs(recReserveEntrySource."Quantity (Base)"),
                                recReserveEntrySource."Serial No.",//SerieNo,
                                recReserveEntrySource."Lot No.");

                        cduCreateReservEntry.CreateEntry(
                            recTransferLine."Item No.",//"Item No.",
                            '',
                            recTransferLine."Transfer-from Code",//"Location Code",
                            '',//''Description,
                            recTransHeader."Receipt Date",
                            recTransHeader."Shipment Date",//"Shipment Date",
                            0,
                            2);

                        cduCreateReservEntry.CreateReservEntryFor(
                            DATABASE::"Transfer Line",
                            1,
                            recTransHeader."No.",
                            '',
                            0,
                            intLineNo,//"Source Line No.",
                            recReserveEntrySource."Qty. per Unit of Measure",//"Qty. per Unit of Measure",
                            abs(recReserveEntrySource.Quantity),
                            abs(recReserveEntrySource."Quantity (Base)"),
                            recReserveEntrySource."Serial No.",//SerieNo,
                            recReserveEntrySource."Lot No.");

                        cduCreateReservEntry.CreateEntry(
                            recTransferLine."Item No.",//"Item No.",
                            '',
                            recTransferLine."Transfer-To Code",//"Location Code",
                            '',//''Description,
                            recTransHeader."Receipt Date",
                            recTransHeader."Shipment Date",//"Shipment Date",
                            0,
                            2);
                    until recReserveEntrySource.Next() = 0;
                intLineNo += 10000;
            /*
            recSalesHeader.Get(recSalesLine."Document Type", recSalesLine."Document No.");
            recSalesHeader.SetHideValidationDialog(true);
            recSalesHeader."External Document No." := 'KONSIGNATION';
            recSalesHeader.Modify(false);
            */
            until recSalesLine.Next() = 0;
            recSalesLine.ModifyAll(DBEAttach2TransOrder, true, false);

        end;

    end;
}