codeunit 50490 SalesDocumentMgt
{
    trigger OnRun()
    begin

    end;

    procedure OpenExcelFile(txt_pSheetName: Text): Boolean
    var
        cduFileMgt: Codeunit "File Management";
        txtFileName: Text;
        insIStream: InStream;
    begin
        //txtFileName := cduFileMgt.OpenFileDialog('Excel File','','*.xls|*.xlsx');
        if UploadIntoStream('Excel File', '', 'All Files (*.*)|*.*|Excel Files (*.xlsx)|*.xlsx', txtFileName, insIStream) then begin
            recGExcelBufferTMP.Reset();
            recGExcelBufferTMP.DeleteAll();

            recGExcelBufferTMP.OpenBookStream(insIStream, txt_pSheetName);
            recGExcelBufferTMP.ReadSheet();
            exit(true);
            //Message(sGetCellValue(8,6));
            /*if recGExcelBufferTMP.FindSet() then
                repeat
                    Message(recGExcelBufferTMP."Cell Value as Text");
                until recGExcelBufferTMP.Next() = 0;*/
        end
        else
            exit(false);

    end;

    procedure createSalesDocument(opt_pDocType: Option)
    var
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";
        recT36: Record "Sales Header";
        recT37: Record "Sales Line";
        recT37TMP: Record "Sales Line" temporary;
        intLineNo: Integer;
        intRow: Integer;
        intRowMax: Integer;
        intCol: Integer;
        xcodNo: code[100];
        decTMP: Decimal;
    begin
        recT36.init;
        recT36.validate("Document Type", opt_pDocType);
        recT36."No." := '';
        recT36.insert(true);


        recT36.Validate("Sell-to Customer No.", sGetCellValue(8, 1));
        if sGetCellValue(8, 2) <> '' then begin
            Evaluate(decTMP, DelChr(sGetCellValue(8, 2), '=', '%'));
            recT36.Validate("Customer Disc. Group", Format(dectmp * 100) + '%');
        end;

        recT36.validate("Document Date", DMY2Date(1, 1, 2019));
        recT36.validate("Posting Date", DMY2Date(1, 1, 2019));
        recT36.validate("Order Date", DMY2Date(1, 1, 2019));
        recT36.Validate("External Document No.", 'KONSIGNATION');
        recT36.Modify(true);

        recGExcelBufferTMP.reset;
        recGExcelBufferTMP.FindLast();
        intLineNo := 10000;
        intRow := 6;//15;
        intRowMax := recGExcelBufferTMP."Row No." - 1;

        recT37TMP.reset;
        recT37TMP.DeleteAll();

        repeat
            recGExcelBufferTMP.SetFilter("Row No.", '%1', intRow);
            recGExcelBufferTMP.FindSet();
            recT37TMP.init;
            recT37TMP."Document Type" := recT36."Document Type";
            recT37TMP."Document No." := recT36."No.";
            recT37TMP."Line No." := intLineNo;
            recT37TMP.insert(false);
            recT37TMP."No." := sGetCellValue(6, intRow);
            evaluate(recT37TMP.Quantity, sGetCellValue(5, intRow));
            recT37TMP.Description := sGetCellValue(4, intRow);
            evaluate(recT37TMP."Shipment Date", sGetCellValue(3, intRow));
            recT37TMP."Description 2" := sGetCellValue(1, intRow);
            recT37TMP.ExtRef := sGetCellValue(2, intRow);
            recT37TMP.Modify(false);
            intRow += 1;
            intLineNo += 10000;
        until intRow > intRowMax;

        intLineNo := 0;
        xcodNo := '';
        recT37TMP.SetCurrentKey("Description 2", "No.", "Shipment Date");

        if recT37TMP.FindSet() then
            repeat
                if xcodNo <> (recT37TMP."Description 2" + recT37TMP."No." + format(recT37TMP."Shipment Date")) then begin
                    xcodNo := recT37TMP."Description 2" + recT37TMP."No." + format(recT37TMP."Shipment Date");
                    intLineNo += 10000;
                    recT37.init;
                    recT37.validate("Document Type", recT36."Document Type");
                    recT37.validate("Document No.", recT36."No.");
                    recT37.Validate("Line No.", intLineNo);
                    recT37.insert(true);

                    recT37.Validate(type, recT37.Type::Item);
                    recT37.Validate("No.", recT37TMP."No.");
                    recT37.Validate("Location Code", 'SC');
                    recT37.Validate(Quantity, recT37TMP.Quantity);
                    recT37."Bin Code" := recT36."Sell-to Customer No."; //.Validate("Bin Code", recT36."Sell-to Customer No.");                    
                    recT37.Validate("Shipment Date", recT37TMP."Shipment Date");
                    recT37."Description 2" := recT37TMP."Description 2";
                    recT37.ExtRef := recT37TMP.ExtRef;
                    if sGetCellValue(8, 2) <> '' then begin
                        Evaluate(decTMP, DelChr(sGetCellValue(8, 2), '=', '%'));
                        recT37.Validate("Line Discount %", decTMP * 100);
                    end;
                    recT37.Modify(true);
                end
                else begin
                    recT37.Validate(Quantity, recT37.quantity + recT37TMP.Quantity);
                    recT37."Bin Code" := recT36."Sell-to Customer No.";
                    if sGetCellValue(8, 2) <> '' then begin
                        Evaluate(decTMP, DelChr(sGetCellValue(8, 2), '=', '%'));
                        recT37.Validate("Line Discount %", decTMP * 100);
                    end;
                    recT37.Modify(true);
                end;

                if recT37TMP.Description <> '' then begin
                    cduCreateReservEntry.CreateReservEntryFor(
                        DATABASE::"Sales Line",
                        recT36."Document Type",
                        recT36."No.",
                        '',
                        0,
                        intLineNo,//"Source Line No.",
                        1,//"Qty. per Unit of Measure",
                        1,
                        1,
                        recT37TMP.Description,//SerieNo,
                        '');

                    cduCreateReservEntry.CreateEntry(
                        recT37."No.",//"Item No.",
                        '',
                        recT37."Location Code",//"Location Code",
                        '',//''Description,
                        0D,
                        recT37TMP."Shipment Date",//"Shipment Date",
                        0,
                        2);
                end;
            until recT37TMP.Next() = 0;
    end;

    procedure createItemJnlLine(opt_pEntryType: Option; cod_pJournalTemplateName: code[20]; cod_pJournalBatchName: Code[20])
    var
        cduCreateReservEntry: Codeunit "Create Reserv. Entry";
        recT83: Record "Item Journal Line";
        recT83TMP: Record "Item Journal Line" temporary;
        recItem: Record item;
        intLineNo: Integer;
        intRow: Integer;
        intRowMax: Integer;
        intCol: Integer;
        xcodNo: code[20];
        diaWin: Dialog;
        text001: label 'Line Record #1#### of #2####';
                        /*
                        FRA = 'Enregistrement ligne #1#### sur #2####',
                        FRS = 'Enregistrement ligne #1#### sur #2####';
                        */
    begin
        recGExcelBufferTMP.reset;
        recGExcelBufferTMP.FindLast();
        intLineNo := 10000;
        intRow := 2;
        intRowMax := recGExcelBufferTMP."Row No.";
        diaWin.Open(text001);
        repeat
            diaWin.Update(1, intRow);
            diaWin.Update(2, intRowMax);
            if recitem.get(sGetCellValue(1, intRow)) then begin


                recGExcelBufferTMP.SetFilter("Row No.", '%1', intRow);
                recGExcelBufferTMP.FindSet();
                recT83.Init();
                recT83.validate("Journal Template Name", cod_pJournalTemplateName);
                recT83.Validate("Journal Batch Name", cod_pJournalBatchName);
                recT83.Validate("Line No.", intLineNo);
                recT83.Insert(true);

                recT83.validate("Posting Date", DMY2Date(1, 1, 2019));
                recT83.Validate("Document No.", 'REPRISE');
                recT83.validate("Entry Type", opt_pEntryType);//recT83."Entry Type"::"Positive Adjmt.");
                recT83.validate("Item No.", sGetCellValue(1, intRow));
                evaluate(recT83.Quantity, sGetCellValue(2, intRow));
                recT83.Validate("Location Code", sGetCellValue(3, intRow));
                if sGetCellValue(6, intRow) <> '' then
                    recT83.Validate("Bin Code", sGetCellValue(6, intRow));
                //recT37TMP.Description := sGetCellValue(4, intRow);
                //evaluate(recT37TMP."Shipment Date", sGetCellValue(3, intRow));
                //recT37TMP."Description 2" := sGetCellValue(1, intRow);            
                recT83.Modify(false);

                //TRACKING
                cduCreateReservEntry.CreateReservEntryFor(
                            DATABASE::"Item Journal Line",
                            opt_pEntryType,
                            cod_pJournalTemplateName,
                            cod_pJournalBatchName,
                            0,
                            intLineNo,//"Source Line No.",
                            1,//"Qty. per Unit of Measure",
                            recT83.Quantity,
                            recT83."Quantity (Base)",
                            sGetCellValue(4, intRow),//SerieNo,
                            '');

                cduCreateReservEntry.CreateEntry(
                    recT83."Item No.",//"Item No.",
                    '',
                    recT83."Location Code",//"Location Code",
                    '',//''Description,
                    0D,
                    0D,//"Shipment Date",
                    0,
                    2);
                intLineNo += 10000;
            end;
            intRow += 1;
        until intRow > intRowMax;
        diaWin.Close();
    end;

    procedure sGetCellValue(intpCol: Integer; intpRow: Integer): Text
    begin
        //recGExcelBufferTMP.Reset;            
        //recGExcelBufferTMP.SetFilter("Column No.",'%1',intpCol);
        //recGExcelBufferTMP.SetFilter("Row No.",'%1',intpRow);
        if recGExcelBufferTMP.Get(intpRow, intpCol) then
            exit(recGExcelBufferTMP."Cell Value as Text")
        else
            exit('');
    end;

    var
        recGExcelBufferTMP: Record "Excel Buffer" temporary;
        myInt: Integer;

        /*
        [EventSubscriber(ObjectType::Table, database::"Item Journal Line", 'OnBeforeModifyEvent', '', true, true)]
        local procedure MyProcedure()
        begin
            error('cancel');
        end;
        */
}