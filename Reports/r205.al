report 50210 "OrderConfirmation"
{
    // version NAVW113.00,NAVDACH13.00,NAVCH13.00

    DefaultLayout = RDLC;
    RDLCLayout = 'Order2.rdl';
    Caption = 'Order Confirmation';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Order';
            column(DocType_SalesHeader; "Document Type")
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
            {
            }
            column(PhoneNoCaption; PhoneNoCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl + AmountCaptionTxt) //AmountCaptionTxt)// AmountCaptionLbl) // GLSetup."LCY Code")//AmountCaptionLbl)
            {
            }
            column(VATPercentageCaption; VATPercentageCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATAmtCaption; VATAmtCaptionLbl)
            {
            }
            column(VATAmtSpecCaption; VATAmtSpecCaptionLbl)
            {
            }
            column(LineAmtCaption; LineAmtCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(UnitPriceCaption; UnitPriceCaptionLbl)
            {
            }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            {
            }
            column(AllowInvDiscCaption; AllowInvDiscCaptionLbl)
            {
            }
            column(TransportMode_Caption; TransportMode_Caption)
            {
            }
            column(recTransportMethod; recTransportMethod.Description)
            {
            }
            column(ExternalDocNoLbl; ExternalDocNoLbl)
            {
            }
            column(YourReferenceLbl; YourReferenceLbl)
            {
            }
            column(OurReferenceLbl; OurReferenceLbl)
            {
            }
            column(SalesHeaderExtDocNo; "Sales Header"."External Document No.")
            {
            }
            column(SalesHeaderYourRef; "Sales Header"."Your Reference")
            {
            }
            column(SalesHeaderOurRef; recUser."Full Name")
            {
            }
            column(Pos_CaptionH; Pos_Caption)
            {
            }
            column(Desc_SalesLineCaptionH; SaleLineDescLbl)//"Sales Line".FIELDCAPTION(Description))
            {
            }
            column(ShipDate_CaptionH; ShipDate_Caption)
            {
            }
            column(Qty_SalesLineCaptionH; Qty_Caption)//"Sales Line".FIELDCAPTION(Quantity))
            {
            }
            column(UnitPriceCaptionH; UnitPriceCaptionLbl)
            {
            }
            column(No2_SalesLineCaptionH; NoRef_Caption)//"Sales Line".FIELDCAPTION("No."))
            {
            }
            column(Carryover_Caption; Carryoverlbl)
            {
            }
            column(FormatCurrencyVal; intFormatCurrencyVal)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CopyText; CopyText)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(OrderConfirmCopyCaption; STRSUBSTNO(Text004, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(FooterLabel1; FooterLabel[1])
                    {
                    }
                    column(FooterLabel2; FooterLabel[2])
                    {
                    }
                    column(FooterLabel3; FooterLabel[3])
                    {
                    }
                    column(FooterLabel4; FooterLabel[4])
                    {
                    }
                    column(FooterLabel5; FooterLabel[5])
                    {
                    }
                    column(FooterLabel6; FooterLabel[6])
                    {
                    }
                    column(FooterLabel7; FooterLabel[7])
                    {
                    }
                    column(FooterLabel8; FooterLabel[8])
                    {
                    }
                    column(FooterTxt1; FooterTxt[1])
                    {
                    }
                    column(FooterTxt2; FooterTxt[2])
                    {
                    }
                    column(FooterTxt3; FooterTxt[3])
                    {
                    }
                    column(FooterTxt4; FooterTxt[4])
                    {
                    }
                    column(FooterTxt5; FooterTxt[5])
                    {
                    }
                    column(FooterTxt6; FooterTxt[6])
                    {
                    }
                    column(FooterTxt7; FooterTxt[7])
                    {
                    }
                    column(FooterTxt8; FooterTxt[8])
                    {
                    }
                    column(HeaderLabel1; HeaderLabel[1])
                    {
                    }
                    column(HeaderLabel2; HeaderLabel[2])
                    {
                    }
                    column(HeaderLabel3; HeaderLabel[3])
                    {
                    }
                    column(HeaderLabel4; HeaderLabel[4])
                    {
                    }
                    column(HeaderTxt1; HeaderTxt[1])
                    {
                    }
                    column(HeaderTxt2; HeaderTxt[2])
                    {
                    }
                    column(HeaderTxt3; HeaderTxt[3])
                    {
                    }
                    column(HeaderTxt4; HeaderTxt[4])
                    {
                    }
                    column(CompanyInfoPhNo; CompanyInfo."Phone No.")
                    {
                        IncludeCaption = false;
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustNo_SalesHeader; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(DocDate_SalesHeader; Format("Sales Header"."Document Date", 0, '<Day,2>.<Month,2>.<Year4>'))//FORMAT("Sales Header"."Document Date",0,'<Day,2>.<Month,2>.<Year4>'))
                    {
                    }
                    column(VATNoText; VATCompNoLbl)//VATNoText)
                    {
                    }
                    column(VATRegNo_SalesHeader; "Sales Header"."VAT Registration No.")
                    {
                    }
                    column(ShptDate_SalesHeader; FORMAT("Sales Header"."Shipment Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; "Sales Header".FIELDCAPTION("External Document No."))
                    {
                    }
                    column(SalesOrderReference_SalesHeader; "Sales Header"."External Document No.")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(PricesInclVAT_SalesHeader; "Sales Header"."Prices Including VAT")
                    {
                    }
                    column(PageCaption; Text005)//STRSUBSTNO(Text005, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PaymentTermsCaption; PaymentTermsCaptionLbl)
                    {
                    }
                    column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
                    {
                    }
                    column(PmntTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(ShptMethodDesc; ShipmentMethod.Code)//ShipmentMethod.Description)
                    {
                    }
                    column(PricesInclVATYesNo_SalesHeader; FORMAT("Sales Header"."Prices Including VAT"))
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankCaption; BankCaptionLbl)
                    {
                    }
                    column(AccountNoCaption; AccountNoCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(OrderNoCaption; OrderNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionCap)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesHeaderCaption; "Sales Header".FIELDCAPTION("Bill-to Customer No."))
                    {
                    }
                    column(PricesInclVAT_SalesHeaderCaption; "Sales Header".FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(RegistrationNoCaption; RegistrationNoCaptionLbl)
                    {
                    }
                    column(CustomerNoCaption; CustomerNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoRegNo; CompanyInfo."Registration No.")
                    {
                    }
                    column(ShipToAddrHeader8; ShipToAddr[8])
                    {
                    }
                    column(ShipToAddrHeader7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddrHeader6; ShipToAddr[6])
                    {
                    }
                    column(ShipToAddrHeader5; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddrHeader4; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddrHeader3; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddrHeader2; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddrHeader1; ShipToAddr[1])
                    {
                    }
                    column(ShiptoAddrCaptionHeader; ShiptoAddrCaptionLbl)
                    {
                    }
                    column(SalesHeaderSellCustNoLbl; SalesHeaderSellCustNoLbl)
                    {
                    }
                    column(SalesHeaderSellCustNo; "Sales Header"."Sell-to Customer No.")
                    {
                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1Number; Number)
                        {
                        }
                        column(HeaderDimCaption; HeaderDimCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FIND('-') THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"),
                                       "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem()
                        begin
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(SalesLineAmt; SalesLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesLine; "Sales Line".Description)
                        {
                        }
                        column(NNCSalesLineLineAmt; NNCSalesLineLineAmt)
                        {
                        }
                        column(NNCSalesLineInvDiscAmt; NNCSalesLineInvDiscAmt)
                        {
                        }
                        column(NNCTotalLCY; NNCTotalLCY)
                        {
                        }
                        column(NNCTotalExclVAT; NNCTotalExclVAT)
                        {
                        }
                        column(NNCVATAmt; NNCVATAmt)
                        {
                        }
                        column(NNCTotalInclVAT; NNCTotalInclVAT)
                        {
                        }
                        column(NNCPmtDiscOnVAT; NNCPmtDiscOnVAT)
                        {
                        }
                        column(NNCTotalInclVAT2; NNCTotalInclVAT2)
                        {
                        }
                        column(NNCVATAmt2; NNCVATAmt2)
                        {
                        }
                        column(NNCTotalExclVAT2; NNCTotalExclVAT2)
                        {
                        }
                        column(VATBaseDisc_SalesHeader; "Sales Header"."VAT Base Discount %")
                        {
                        }
                        column(DisplayAssemblyInfo; DisplayAssemblyInformation)
                        {
                        }
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(No2_SalesLine; "Sales Line"."Description 2")//"Sales Line"."No.")
                        {
                        }
                        column(Qty_SalesLine; "Sales Line".Quantity)
                        {
                        }
                        column(Qty_SalesLine2; Qty_TxtVal)//FORMAT("Sales Line".Quantity,0,'<Precision,0:0><Standard Format,2>'))//"Sales Line".Quantity)
                        {
                        }
                        column(UOM_SalesLine; "Sales Line"."Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;//2;
                            //IncludeCaption = false;
                        }
                        column(LineDisc_SalesLine; "Sales Line"."Line Discount %")
                        {
                        }
                        column(LineAmt_SalesLine; "Sales Line"."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";//'<precision, 0:0><standard format, 0>';//"Sales Line"."Currency Code";//"Sales Header"."Currency Code";
                            AutoFormatType = 1;
                            //DecimalPlaces = 0;

                        }
                        column(AllowInvDisc_SalesLine; "Sales Line"."Allow Invoice Disc.")
                        {

                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."VAT Identifier")
                        {
                        }
                        column(SubtotalNet_SalesLine; -1)//"Sales Line"."Subtotal Net")
                        {
                        }
                        column(Type_SalesLine; FORMAT("Sales Line".Type))
                        {
                        }
                        column(No_SalesLine; "Sales Line"."Line No.")
                        {
                        }
                        column(AllowInvDiscountYesNo_SalesLine; FORMAT("Sales Line"."Allow Invoice Disc."))
                        {
                        }
                        column(AsmInfoExistsForLine; AsmInfoExistsForLine)
                        {
                        }
                        column(SalesLineInvDiscAmt; SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(SalsLinAmtExclLineDiscAmt; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText; TotalLbl)// TotalExclVATText)
                        {
                        }
                        column(VATAmtLineVATAmtText3; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalInclVATText; TotalVATLbl + AmountCaptionTxt)// TotalInclVATText)
                        {
                        }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesLineAmtExclLineDisc; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount" + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(DiscountPercentCaption; DiscountPercentCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscountVATCaption; PaymentDiscountVATCaptionLbl)
                        {
                        }
                        column(Desc_SalesLineCaption; SaleLineDescLbl)//"Sales Line".FIELDCAPTION(Description))
                        {
                        }
                        column(No2_SalesLineCaption; NoRef_Caption)//"Sales Line".FIELDCAPTION("No."))
                        {
                        }
                        column(Qty_SalesLineCaption; Qty_Caption)//"Sales Line".FIELDCAPTION(Quantity))
                        {
                        }
                        column(UOM_SalesLineCaption; "Sales Line".FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(VATIdentifier_SalesLineCaption; "Sales Line".FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(VAT_SalesLine; "Sales Line"."VAT %")
                        {
                        }
                        column(VAT_SalesLineCaption; "Sales Line".FIELDCAPTION("VAT %"))
                        {
                        }
                        column(NewPageGroupNo; NewPageGroupNo)
                        {
                        }
                        column(NewPageLine; NewPageLine)
                        {
                        }
                        column(Pos_Caption; Pos_Caption)
                        {
                        }
                        column(Number; Pos_Valuetxt)//Number)
                        {
                        }
                        column(ShipDate; ShipDate_ValueTxt)
                        {
                        }
                        column(ShipDate_Caption; ShipDate_Caption)
                        {
                        }
                        column(TotQty_Val; TotQty_Val)
                        {
                        }
                        column(TotQty_TxtVal; TotQty_TxtVal)
                        {
                        }
                        column(extref; "Sales Line".ExtRef)
                        {
                        }
                        column(NNCSalesLineLineAmtItemSrv; NNCSalesLineLineAmtItemSrv)
                        {
                        }
                        column(formatDecimal; cduFormatMgt.getRDLFormatDecimalPlace("Sales Header"."Currency Code"))
                        {

                        }
                        column(LanguageCode; cduFormatMgt.getRDLLangueCode("Sales Header"."Currency Code"))
                        {
                        }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));
                            column(DimText2; DimText)
                            {
                            }
                            column(LineDimCaption; LineDimCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }
                        dataitem(AsmLoop; Integer)
                        {
                            DataItemTableView = SORTING(Number);
                            column(AsmLineType; AsmLine.Type)
                            {
                            }
                            column(AsmLineNo; BlanksForIndent + AsmLine."No.")
                            {
                            }
                            column(AsmLineDescription; BlanksForIndent + AsmLine.Description)
                            {
                            }
                            column(AsmLineQuantity; AsmLine.Quantity)
                            {
                            }
                            column(AsmLineUOMText; GetUnitOfMeasureDescr(AsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN
                                    AsmLine.FINDSET
                                ELSE
                                    AsmLine.NEXT;
                            end;

                            trigger OnPreDataItem()
                            begin
                                IF NOT DisplayAssemblyInformation THEN
                                    CurrReport.BREAK;
                                IF NOT AsmInfoExistsForLine THEN
                                    CurrReport.BREAK;
                                AsmLine.SETRANGE("Document Type", AsmHeader."Document Type");
                                AsmLine.SETRANGE("Document No.", AsmHeader."No.");
                                SETRANGE(Number, 1, AsmLine.COUNT);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            recSalesLine: Record "Sales Line";
                            recExtTextHeader: Record "Extended Text Header";
                            RecExtTextLine: Record "Extended Text Line";
                            recItemLocal: Record Item;

                        begin
                            IF Number = 1 THEN
                                SalesLine.FIND('-')
                            ELSE
                                SalesLine.NEXT;

                            //>>
                            /*
                            if ("Sales Header"."No." = '101022') or ("Sales Header"."No." = '101016') then
                                if Confirm(Format(SalesLine.Type) + ' - ' + format(SalesLine."Attached to Line No.") + ' - ' + format(SalesLine."Line No.") + ' - ' + format(xintAttacheLineNo) + ' - ' + txtDesc2) then
                                    Error('cancel');
                            */
                            if SalesLine.type = salesline.type::item then begin
                                txtDesc2 := SalesLine.ExtRef;
                                xintAttacheLineNo := -1;
                                recSalesLine.setfilter("Document Type", '%1', SalesLine."Document Type");
                                recSalesLine.SetFilter("Document No.", '%1', SalesLine."Document No.");
                                recSalesLine.SetFilter("Attached to Line No.", '%1', SalesLine."Line No.");
                                if recSalesLine.Findfirst then begin
                                    recExtTextHeader.SETRANGE("Table Name", SalesLine.Type);
                                    recExtTextHeader.SETRANGE("No.", SalesLine."No.");
                                    recExtTextHeader.SETRANGE("Sales Order", TRUE);
                                    recExtTextHeader.SETCURRENTKEY(
                                        "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                                    recExtTextHeader.SETRANGE("Starting Date", 0D, "Sales Header"."Document Date");
                                    recExtTextHeader.SETFILTER("Ending Date", '%1..|%2', "Sales Header"."Document Date", 0D);
                                    IF "Sales Header"."Language Code" = '' THEN
                                        recExtTextHeader.SETRANGE("Language Code", '')
                                    else
                                        recExtTextHeader.SETRANGE("Language Code", "Sales Header"."Language Code");
                                    if recExtTextHeader.FindFirst() then begin
                                        //SalesLine."No." := recExtTextHeader.Description;
                                        SalesLine."Description 2" := recExtTextHeader.Description;
                                        SalesLine.Description := recSalesLine.Description;
                                    end;
                                end
                                else begin
                                    recExtTextHeader.SETRANGE("Table Name", SalesLine.Type);
                                    recExtTextHeader.SETRANGE("No.", SalesLine."No.");
                                    recExtTextHeader.SETRANGE("Sales Order", TRUE);
                                    recExtTextHeader.SETCURRENTKEY(
                                        "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                                    recExtTextHeader.SETRANGE("Starting Date", 0D, "Sales Header"."Document Date");
                                    recExtTextHeader.SETFILTER("Ending Date", '%1..|%2', "Sales Header"."Document Date", 0D);
                                    IF "Sales Header"."Language Code" = '' THEN
                                        recExtTextHeader.SETRANGE("Language Code", '')
                                    else
                                        recExtTextHeader.SETRANGE("Language Code", "Sales Header"."Language Code");
                                    if recExtTextHeader.FindFirst() then
                                        SalesLine."Description 2" := recExtTextHeader.Description
                                    else
                                        SalesLine."Description 2" := SalesLine."No.";

                                end;
                            end
                            else
                                if (salesLine.Type = SalesLine.type::" ") and (SalesLine."Attached to Line No." > 0) and
                                 (SalesLine."Attached to Line No." <> xintAttacheLineNo) then begin
                                    xintAttacheLineNo := SalesLine."Attached to Line No.";
                                    CurrReport.Skip();
                                end
                                else
                                    if (salesLine.Type = SalesLine.type::" ") and (SalesLine."Attached to Line No." > 0) and
                                       (SalesLine."Attached to Line No." = xintAttacheLineNo) and (txtDesc2 <> '') then begin
                                        SalesLine.ExtRef := txtDesc2;
                                        txtDesc2 := '';

                                    end
                                    else
                                        if (salesLine.Type = SalesLine.type::" ") and (SalesLine."Attached to Line No." = 0) and (txtDesc2 <> '') then begin
                                            SalesLine.ExtRef := txtDesc2;
                                            txtDesc2 := '';
                                        end;
                            //<<
                            "Sales Line" := SalesLine;

                            Pos_Valuetxt := '';
                            ShipDate_ValueTxt := '';
                            if (SalesLine.Type = SalesLine.Type::Item) then
                                if recItem.Get(SalesLine."No.") then
                                    if recItem.Type <> recItem.Type::Service then begin
                                        Pos_Value += 1;
                                        Pos_Valuetxt := format(Pos_Value);
                                        ShipDate_ValueTxt := Format(SalesLine."Shipment Date", 0, '<Day,2>.<Month,2>.<Year4>');
                                    end;
                            if (SalesLine.Quantity = 0) or ((SalesLine.Type = SalesLine.Type::Item) AND (recItemLocal.Get(SalesLine."No.")) and (recItemLocal.Type = recItemLocal.Type::Service)) then
                                Qty_TxtVal := ''
                            else begin

                                Qty_TxtVal := FORMAT(SalesLine.Quantity, 0, '<Precision,0:0><Standard Format,2>');

                                TotQty_Val += SalesLine.Quantity;
                                TotQty_TxtVal := FORMAT(TotQty_Val, 0, '<Precision,0:0><Standard Format,2>');
                            end;
                            IF DisplayAssemblyInformation THEN
                                AsmInfoExistsForLine := SalesLine.AsmToOrderExists(AsmHeader);

                            IF NOT "Sales Header"."Prices Including VAT" AND
                               (SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Full VAT")
                            THEN
                                SalesLine."Line Amount" := 0;

                            IF (SalesLine.Type = SalesLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "Sales Line"."No." := '';

                            if (SalesLine.Type = SalesLine.Type::Item) AND (recItemLocal.Get(SalesLine."No.")) and (recItemLocal.Type = recItemLocal.Type::Service) then begin
                                recExtTextHeader.SETRANGE("Table Name", SalesLine.Type);
                                recExtTextHeader.SETRANGE("No.", "Sales Line"."No.");
                                recExtTextHeader.SETRANGE("Sales Order", TRUE);
                                recExtTextHeader.SETCURRENTKEY(
                                    "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                                recExtTextHeader.SETRANGE("Starting Date", 0D, "Sales Header"."Document Date");
                                recExtTextHeader.SETFILTER("Ending Date", '%1..|%2', "Sales Header"."Document Date", 0D);
                                IF "Sales Header"."Language Code" = '' THEN
                                    recExtTextHeader.SETRANGE("Language Code", '')
                                else
                                    recExtTextHeader.SETRANGE("Language Code", "Sales Header"."Language Code");
                                if recExtTextHeader.FindFirst() then begin
                                    RecExtTextLine.SETRANGE("Table Name", SalesLine.Type);
                                    RecExtTextLine.SETRANGE("No.", "Sales Line"."No.");
                                    IF "Sales Header"."Language Code" = '' THEN
                                        RecExtTextLine.SETRANGE("Language Code", '')
                                    else
                                        RecExtTextLine.SETRANGE("Language Code", "Sales Header"."Language Code");
                                    RecExtTextLine.setfilter("Text No.", '%1', recExtTextHeader."Text No.");
                                    if RecExtTextLine.FindFirst() then
                                        "Sales Line".Description := RecExtTextLine.Text
                                    else
                                        "Sales Line".Description := recExtTextHeader.Description;
                                end;
                                recSalesLineItemServiceTMP.TransferFields("Sales Line");
                                recSalesLineItemServiceTMP.Insert(false);

                                NNCSalesLineLineAmtItemSrv += SalesLine."Line Amount";
                                NNCSalesLineInvDiscAmt += SalesLine."Inv. Discount Amount";

                                NNCTotalLCY := NNCSalesLineLineAmt + NNCSalesLineLineAmtItemSrv - NNCSalesLineInvDiscAmt;

                                NNCTotalExclVAT := NNCTotalLCY;
                                NNCVATAmt := VATAmount;
                                NNCTotalInclVAT := NNCTotalLCY - NNCVATAmt;

                                NNCPmtDiscOnVAT := -VATDiscountAmount;

                                NNCTotalInclVAT2 := TotalAmountInclVAT;

                                NNCVATAmt2 := VATAmount;
                                NNCTotalExclVAT2 := VATBaseAmount;
                                //if confirm(format(NNCSalesLineLineAmtItemSrv) + ' / ' + format(NNCTotalLCY)) then
                                //    Error('cancel');
                                //CurrReport.Skip();
                                "Sales Line"."No." := '';
                                "Sales Line".Description := '';
                                "Sales Line"."Description 2" := '';
                                "Sales Line".Quantity := 0;
                                "Sales Line"."Line Amount" := 0;
                                "Sales Line"."Unit Price" := 0;
                            end
                            else begin

                                NNCSalesLineLineAmt += SalesLine."Line Amount";
                                NNCSalesLineInvDiscAmt += SalesLine."Inv. Discount Amount";

                                NNCTotalLCY := NNCSalesLineLineAmt + NNCSalesLineLineAmtItemSrv - NNCSalesLineInvDiscAmt;

                                NNCTotalExclVAT := NNCTotalLCY;
                                NNCVATAmt := VATAmount;
                                NNCTotalInclVAT := NNCTotalLCY - NNCVATAmt;

                                NNCPmtDiscOnVAT := -VATDiscountAmount;

                                NNCTotalInclVAT2 := TotalAmountInclVAT;

                                NNCVATAmt2 := VATAmount;
                                NNCTotalExclVAT2 := VATBaseAmount;
                            end;
                            Sales_Nu_Type := SalesLine.Type;
                            //Sales_Nu_Type_Title := SalesLine.Type::Title;

                            /*
                            NewPageLine := "Sales Line".Type = "Sales Line".Type:: :"New Page";
                            IF NewPageLine THEN BEGIN
                                CurrPageFooterHiddenFlg := 1;
                                NewPageGroupNo += 1;
                            END ELSE
                                CurrPageFooterHiddenFlg := 0;
                            */
                        end;

                        trigger OnPostDataItem()
                        begin
                            SalesLine.DELETEALL;
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := SalesLine.FIND('+');
                            WHILE MoreLines AND (SalesLine.Description = '') AND (SalesLine."Description 2" = '') AND
                                  (SalesLine."No." = '') AND (SalesLine.Quantity = 0) AND
                                  (SalesLine.Amount = 0)
                            DO
                                MoreLines := SalesLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SalesLine.SETRANGE("Line No.", 0, SalesLine."Line No.");
                            SETRANGE(Number, 1, SalesLine.COUNT);
                            Pos_Value := 0;
                            TotQty_Val := 0;
                            NewPageLine := FALSE;
                            recSalesLineItemServiceTMP.DeleteAll();
                        end;
                    }
                    dataitem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmountLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercentage; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF VATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                        end;
                    }
                    dataitem(VATCounterLCY; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercentage2; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier2; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY :=
                              VATAmountLine.GetBaseLCY(
                                "Sales Header"."Posting Date", "Sales Header"."Currency Code", "Sales Header"."Currency Factor");
                            VALVATAmountLCY :=
                              VATAmountLine.GetAmountLCY(
                                "Sales Header"."Posting Date", "Sales Header"."Currency Code", "Sales Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Sales Header"."Currency Code" = '') OR
                               (VATAmountLine.GetTotalVATAmount = 0)
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Header"."Posting Date", "Sales Header"."Currency Code", 1);
                            VALExchRate := STRSUBSTNO(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesHeader; "Sales Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShiptoAddrCaption; ShiptoAddrCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesHeaderCaption; "Sales Header".FIELDCAPTION("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(PrepmtLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));
                        column(PrepmtLineAmount; PrepmtLineAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvBufDesc; PrepmtInvBuf.Description)
                        {
                        }
                        column(PrepmtInvBufGLAccNo; PrepmtInvBuf."G/L Account No.")
                        {
                        }
                        column(TotalExclVATText2; TotalLbl)// TotalExclVATText)
                        {
                        }
                        column(PrepmtVATAmtLineVATAmtTxt; PrepmtVATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalInclVATText2; TotalInclVATText)
                        {
                        }
                        column(PrepmtInvAmount; PrepmtInvBuf.Amount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmount; PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvAmtInclVATAmt; PrepmtInvBuf.Amount + PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText2; VATAmountLine.VATAmountText)
                        {
                        }
                        column(PrepmtTotalAmountInclVAT; PrepmtTotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATBaseAmount; PrepmtVATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtLoopNumber; Number)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(GLAccountNoCaption; GLAccountNoCaptionLbl)
                        {
                        }
                        column(PrepaymentSpecCaption; PrepaymentSpecCaptionLbl)
                        {
                        }
                        dataitem(PrepmtDimLoop; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));
                            column(DimText3; DimText)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT TempPrepmtDimSetEntry.FIND('-') THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText :=
                                          STRSUBSTNO('%1 %2', TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL TempPrepmtDimSetEntry.NEXT = 0;
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT PrepmtInvBuf.FIND('-') THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF PrepmtInvBuf.NEXT = 0 THEN
                                    CurrReport.BREAK;

                            IF ShowInternalInfo THEN
                                DimMgt.GetDimensionSet(TempPrepmtDimSetEntry, PrepmtInvBuf."Dimension Set ID");

                            IF "Sales Header"."Prices Including VAT" THEN
                                PrepmtLineAmount := PrepmtInvBuf."Amount Incl. VAT"
                            ELSE
                                PrepmtLineAmount := PrepmtInvBuf.Amount;
                        end;
                    }
                    dataitem(PrepmtVATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(PrepmtVATAmtLineVATAmt; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineVATBase; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineLineAmt; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmtLineVATPerc; PrepmtVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(PrepmtVATAmtLineVATIdent; PrepmtVATAmountLine."VAT Identifier")
                        {
                        }
                        column(PrepmtVATCounterNumber; Number)
                        {
                        }
                        column(PrepaymentVATAmtSpecCap; PrepaymentVATAmtSpecCapLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            PrepmtVATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SETRANGE(Number, 1, PrepmtVATAmountLine.COUNT);
                        end;
                    }
                    dataitem(PrepmtTotal; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(PrepmtPmtTermsDesc; PrepmtPaymentTerms.Description)
                        {
                        }
                        column(PrepmtPmtTermsDescCaption; PrepmtPmtTermsDescCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT PrepmtInvBuf.FIND('-') THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(ItemTypeSrv; Integer)
                    {
                        column(ItemNoSrv; recSalesLineItemServiceTMP."No.")
                        {
                        }
                        column(ItemDescSrv2; recSalesLineItemServiceTMP."Description 2")
                        {
                        }
                        column(ItemDescSrv; recSalesLineItemServiceTMP.Description)
                        {
                        }
                        trigger OnPreDataItem()
                        begin
                            ItemTypeSrv.SetRange(Number, 1, recSalesLineItemServiceTMP.Count());

                        end;

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN
                                recSalesLineItemServiceTMP.FIND('-')
                            ELSE
                                recSalesLineItemServiceTMP.NEXT;


                        end;
                    }
                }

                trigger OnAfterGetRecord()
                var
                    PrepmtSalesLine: Record "Sales Line" temporary;
                    TempSalesLine: Record "Sales Line" temporary;
                    SalesPost: Codeunit "sales-post";
                begin
                    CLEAR(SalesLine);
                    CLEAR(SalesPost);
                    VATAmountLine.DELETEALL;
                    SalesLine.DELETEALL;
                    SalesPost.GetSalesLines("Sales Header", SalesLine, 0);
                    SalesLine.CalcVATAmountLines(0, "Sales Header", SalesLine, VATAmountLine);
                    SalesLine.UpdateVATOnLines(0, "Sales Header", SalesLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    PrepmtInvBuf.DELETEALL;
                    SalesPostPrepmt.GetSalesLines("Sales Header", 0, PrepmtSalesLine);

                    IF NOT PrepmtSalesLine.ISEMPTY THEN BEGIN
                        SalesPostPrepmt.GetSalesLinesToDeduct("Sales Header", TempSalesLine);
                        IF NOT TempSalesLine.ISEMPTY THEN
                            SalesPostPrepmt.CalcVATAmountLines("Sales Header", TempSalesLine, PrepmtVATAmountLineDeduct, 1);
                    END;
                    SalesPostPrepmt.CalcVATAmountLines("Sales Header", PrepmtSalesLine, PrepmtVATAmountLine, 0);
                    PrepmtVATAmountLine.DeductVATAmountLine(PrepmtVATAmountLineDeduct);
                    SalesPostPrepmt.UpdateVATOnLines("Sales Header", PrepmtSalesLine, PrepmtVATAmountLine, 0);
                    SalesPostPrepmt.BuildInvLineBuffer("Sales Header", PrepmtSalesLine, 0, PrepmtInvBuf);//BuildInvLineBuffer2("Sales Header", PrepmtSalesLine, 0, PrepmtInvBuf);
                    PrepmtVATAmount := PrepmtVATAmountLine.GetTotalVATAmount;
                    PrepmtVATBaseAmount := PrepmtVATAmountLine.GetTotalVATBase;
                    PrepmtTotalAmountInclVAT := PrepmtVATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN BEGIN
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    END;
                    //CurrReport.PAGENO := 1;

                    NNCTotalLCY := 0;
                    NNCTotalExclVAT := 0;
                    NNCVATAmt := 0;
                    NNCTotalInclVAT := 0;
                    NNCPmtDiscOnVAT := 0;
                    NNCTotalInclVAT2 := 0;
                    NNCVATAmt2 := 0;
                    NNCTotalExclVAT2 := 0;
                    NNCSalesLineLineAmt := 0;
                    NNCSalesLineInvDiscAmt := 0;
                    NNCSalesLineLineAmtItemSrv := 0;
                end;

                trigger OnPostDataItem()
                begin
                    IF Print THEN
                        CODEUNIT.RUN(CODEUNIT::"Sales-Printed", "Sales Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                txtTMP: text;
            begin

                if not recTransportMethod.Get("Sales Header"."Transport Method") then
                    recTransportMethod.init;

                recUser.SetCurrentKey("User Name");
                recUser.SetFilter("User Name", '%1', "Sales Header"."Assigned User ID");
                if not recUser.FindFirst() then
                    recUser.Init();

                if recCurrency.get("Sales Header"."Currency Code") then begin
                    txtTMP := format(recCurrency."Amount Rounding Precision");
                    //txtFormatCurrencyVal := ConvertStr(format(recCurrency."Amount Rounding Precision"),'1','0');
                    //txtFormatCurrencyVal := '#,##' + txtFormatCurrencyVal;
                    if recCurrency."Amount Rounding Precision" = 1 then
                        intFormatCurrencyVal := 0
                    else
                        intFormatCurrencyVal := strlen(CopyStr(txtTMP, StrPos(txtTMP, '.') + 1));

                end
                else
                    intFormatCurrencyVal := 2;//'#.##0.00';
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                if "Language Code" <> '' then
                    CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
                "Sales Header"."Bill-to Contact" := '';
                "Sales Header"."Sell-to Contact" := '';
                "Sales Header"."Ship-to Contact" := '';
                "Sales Header"."Bill-to Contact No." := '';
                "Sales Header"."Sell-to Contact No." := '';
                FormatAddressFields("Sales Header");
                FormatDocumentFields("Sales Header");

                PrepareHeader;
                PrepareFooter;

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF Print THEN BEGIN
                    IF CurrReport.USEREQUESTPAGE AND ArchiveDocument OR
                        NOT CurrReport.USEREQUESTPAGE AND SalesSetup."Archive Orders"
                    THEN
                        ArchiveManagement.StoreSalesDocument("Sales Header", LogInteraction);
                END;
            end;

            trigger OnPreDataItem()
            begin
                Print := Print OR NOT IsReportInPreviewMode;

                CurrPageFooterHiddenFlg := 0;
                CurrPageHeaderHiddenFlg := 0;
                CurrGroupPageNO := 0;
                InnerGroupPageNO := 1;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archive Document';
                        ToolTip = 'Specifies if the document is archived after you print it.';

                        trigger OnValidate()
                        begin
                            IF NOT ArchiveDocument THEN
                                LogInteraction := FALSE;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';

                        trigger OnValidate()
                        begin
                            IF LogInteraction THEN
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
                    }
                    field(ShowAssemblyComponents; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := TRUE;
            ArchiveDocument := SalesSetup."Archive Orders";
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction;

            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.GET;
        CompanyInfo.GET;
        SalesSetup.GET;
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);

        NewPageGroupNo := 0;
    end;

    trigger OnPostReport()
    begin
        IF LogInteraction AND Print THEN
            IF "Sales Header".FINDSET THEN
                REPEAT
                    "Sales Header".CALCFIELDS("No. of Archived Versions");
                    IF "Sales Header"."Bill-to Contact No." <> '' THEN
                        SegManagement.LogDocument(
                          SegManagement.SalesOrderConfirmInterDocType, "Sales Header"."No.", "Sales Header"."Doc. No. Occurrence",
                          "Sales Header"."No. of Archived Versions", DATABASE::Contact, "Sales Header"."Bill-to Contact No."
                          , "Sales Header"."Salesperson Code", "Sales Header"."Campaign No.", "Sales Header"."Posting Description",
                          "Sales Header"."Opportunity No.")
                    ELSE
                        SegManagement.LogDocument(
                          SegManagement.SalesOrderConfirmInterDocType, "Sales Header"."No.", "Sales Header"."Doc. No. Occurrence",
                          "Sales Header"."No. of Archived Versions", DATABASE::Customer, "Sales Header"."Bill-to Customer No.",
                          "Sales Header"."Salesperson Code", "Sales Header"."Campaign No.", "Sales Header"."Posting Description",
                          "Sales Header"."Opportunity No.");
                UNTIL "Sales Header".NEXT = 0;
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text004: Label 'Order Confirmation %1', Comment = '%1 = Document No.';
        Text005: Label 'Page %1 of %2';//'Page %1';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        VATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        SalesLine: Record "Sales Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        TempPrepmtDimSetEntry: Record "Dimension Set Entry" temporary;
        PrepmtInvBuf: Record "Prepayment Inv. Line Buffer" temporary;
        RespCenter: Record "Responsibility Center";
        Language: codeunit Language;//Language: Record "language";
        CurrExchRate: Record "Currency Exchange Rate";
        AsmHeader: Record "Assembly Header";
        AsmLine: Record "Assembly Line";
        recTransportMethod: record "Transport Method";
        recItem: Record Item;
        recUser: record "User";
        recCurrency: record Currency;
        recSalesLineItemServiceTMP: record "Sales Line" temporary;
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit "SegManagement";
        ArchiveManagement: Codeunit "ArchiveManagement";
        FormatDocument: Codeunit "Format Document";
        SalesPostPrepmt: Codeunit "Sales-Post Prepayments";
        DimMgt: Codeunit "DimensionManagement";
        cduFormatMgt: Codeunit DBEFormatMgt;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        VALExchRate: Text[50];
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        OutputNo: Integer;
        NNCTotalLCY: Decimal;
        NNCTotalExclVAT: Decimal;
        NNCVATAmt: Decimal;
        NNCTotalInclVAT: Decimal;
        NNCPmtDiscOnVAT: Decimal;
        NNCTotalInclVAT2: Decimal;
        NNCVATAmt2: Decimal;
        NNCTotalExclVAT2: Decimal;
        NNCSalesLineLineAmt: Decimal;
        NNCSalesLineInvDiscAmt: Decimal;
        NNCSalesLineLineAmtItemSrv: Decimal;
        Print: Boolean;
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmInfoExistsForLine: Boolean;
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankCaptionLbl: Label 'Bank';
        AccountNoCaptionLbl: Label 'Account No.';
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        OrderNoCaptionLbl: Label 'Order No.';
        HomePageCaptionCap: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
        HeaderDimCaptionLbl: Label 'Header Dimensions';
        DiscountPercentCaptionLbl: Label 'Discount %';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscountVATCaptionLbl: Label 'Payment Discount on VAT';
        LineDimCaptionLbl: Label 'Line Dimensions';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        ShiptoAddrCaptionLbl: Label 'Ship-to Address';
        DescriptionCaptionLbl: Label 'Description';
        GLAccountNoCaptionLbl: Label 'G/L Account No.';
        PrepaymentSpecCaptionLbl: Label 'Prepayment Specification';
        PrepaymentVATAmtSpecCapLbl: Label 'Prepayment VAT Amount Specification';
        PrepmtPmtTermsDescCaptionLbl: Label 'Prepmt. Payment Terms';
        PhoneNoCaptionLbl: Label 'Phone No.';
        AmountCaptionLbl: Label 'Amount';
        AmountTxtCst: TextConst ENU = 'Amount', FRA = 'Montant', DES = 'Betrag', FRS = 'Montant';
        AmountCaptionTxt: Text;
        VATPercentageCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        LineAmtCaptionLbl: Label 'Line Amount';
        TotalCaptionLbl: Label 'Total';
        UnitPriceCaptionLbl: Label 'Unit Price';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        DocumentDateCaptionLbl: Label 'Document Date';
        AllowInvDiscCaptionLbl: Label 'Allow Invoice Discount';
        FooterLabel: array[20] of Text[30];
        FooterTxt: array[20] of Text[120];
        HeaderLabel: array[20] of Text[30];
        HeaderTxt: array[20] of Text[120];
        CustPostGrp: Record "Customer Posting Group";
        ML_SalesPerson: Label 'Salesperson';
        ML_Reference: Label 'Reference';
        ML_ApplyToDoc: Label 'Refers to Document';
        ML_ShipCond: Label 'Shipping Conditions';
        ML_ShipAdr: Label 'Shipping Address';
        ML_InvAdr: Label 'Invoice Address';
        ML_PmtTerms: Label 'Payment Terms';
        ML_OrderAdr: Label 'Order Address';
        ML_ShipDate: Label 'Shipping Date';
        ML_Bank: Label 'Bank Information';
        ML_AccNo: Label 'Account';
        TotalLbl: label 'Total Without VAT';
        TotalVATLbl: label 'Total';
        Sales_Nu_Type: Integer;
        Sales_Nu_Type_Title: Integer;
        CurrGroupPageNO: Integer;
        InnerGroupPageNO: Integer;
        CurrPageHeaderHiddenFlg: Integer;
        CurrPageFooterHiddenFlg: Integer;
        RegistrationNoCaptionLbl: Label 'Reg.No.';
        CustomerNoCaptionLbl: Label 'Customer No.';
        ML_Continued: Label 'Continued';
        NewPageGroupNo: Integer;
        NewPageLine: Boolean;
        Pos_Caption: Label 'Pos';
        Qty_Caption: Label 'Qty';
        NoRef_Caption: Label 'Reference';
        ShipDate_Caption: Label 'Delivery';
        TransportMode_Caption: Label 'Mode of Delivery';
        SalesHeaderSellCustNoLbl: Label 'Customer No.';
        ExternalDocNoLbl: Label 'External Document No.';
        YourReferenceLbl: Label 'Your Reference';
        OurReferenceLbl: Label 'Our Reference';
        VATCompNoLbl: Label 'VAT Registration No.';
        CarryoverLbl: Label 'Carryover';
        SaleLineDescLbl: Label 'Description';
        Pos_Value: Integer;
        Pos_Valuetxt: Text;
        ShipDate_ValueTxt: Text;
        Qty_TxtVal: Text;
        TotQty_Val: Decimal;
        TotQty_TxtVal: text;
        intFormatCurrencyVal: Integer;
        xintAttacheLineNo: Integer;
        txtDesc2: text;

    procedure InitializeRequest(NoOfCopiesFrom: Integer; ShowInternalInfoFrom: Boolean; ArchiveDocumentFrom: Boolean; LogInteractionFrom: Boolean; PrintFrom: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NoOfCopiesFrom;
        ShowInternalInfo := ShowInternalInfoFrom;
        ArchiveDocument := ArchiveDocumentFrom;
        LogInteraction := LogInteractionFrom;
        Print := PrintFrom;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(3) <> '';
    end;

    local procedure FormatAddressFields(var SalesHeader: Record "Sales Header")
    begin
        FormatAddr.GetCompanyAddr(SalesHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesHeaderBillTo(CustAddr, SalesHeader);
        ShowShippingAddr := FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, SalesHeader);
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header")
    begin
        WITH SalesHeader DO BEGIN
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            if "Currency Code" = '' then
                AmountCaptionTxt := ' ' + GLSetup."LCY Code"//AmountTxtCst// + ' ' + GLSetup."LCY Code"//AmountCaptionLbl + ' ' + GLSetup."LCY Code"
            else
                AmountCaptionTxt := ' ' + "Currency Code";// AmountTxtCst;// + ' ' + "Sales Header"."Currency Code";//AmountCaptionLbl + ' ' + "Sales Header"."Currency Code";     
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetPaymentTerms(PrepmtPaymentTerms, "Prepmt. Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FIELDCAPTION("VAT Registration No."));
        END;
    end;

    local procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[10]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        IF NOT UnitOfMeasure.GET(UOMCode) THEN
            EXIT(UOMCode);
        EXIT(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        EXIT(PADSTR('', 2, ' '));
    end;

    procedure PrepareHeader()
    begin
        CLEAR(HeaderLabel);
        CLEAR(HeaderTxt);

        WITH "Sales Header" DO BEGIN
            FormatAddr.SalesHeaderSellTo(CustAddr, "Sales Header");

            IF SalesPurchPerson.GET("Salesperson Code") THEN BEGIN
                HeaderLabel[2] := ML_SalesPerson;
                HeaderTxt[2] := SalesPurchPerson.Name;
            END;

            IF "Your Reference" <> '' THEN BEGIN
                HeaderLabel[3] := ML_Reference;
                HeaderTxt[3] := "Your Reference";
            END;

            COMPRESSARRAY(HeaderLabel);
            COMPRESSARRAY(HeaderTxt);

            // To filter rounding line
            CustPostGrp.GET("Customer Posting Group");
        END;
    end;

    procedure PrepareFooter()
    begin
        CLEAR(FooterLabel);
        CLEAR(FooterTxt);

        WITH "Sales Header" DO BEGIN
            IF PaymentTerms.GET("Payment Terms Code") THEN BEGIN
                FooterLabel[1] := ML_PmtTerms;
                PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                FooterTxt[1] := PaymentTerms.Description;
            END;

            // Application no for credit memos
            IF "Applies-to Doc. No." <> '' THEN BEGIN
                FooterLabel[2] := ML_ApplyToDoc;
                FooterTxt[2] := FORMAT("Applies-to Doc. Type") + ' ' + "Applies-to Doc. No.";
            END;

            // Shipping Conditions
            IF ShipmentMethod.GET("Shipment Method Code") THEN BEGIN
                FooterLabel[3] := ML_ShipCond;
                ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                FooterTxt[3] := ShipmentMethod.Description;
            END;

            // Shipping Address
            IF "Ship-to Code" <> '' THEN BEGIN
                FooterLabel[4] := ML_ShipAdr;
                FooterTxt[4] := "Ship-to Name" + ' ' + "Ship-to City";
            END;

            // Invoice and Order Address
            IF "Sell-to Customer No." <> "Bill-to Customer No." THEN BEGIN
                FooterLabel[5] := ML_InvAdr;
                FooterTxt[5] := "Bill-to Name" + ', ' + "Bill-to City";
                FooterLabel[6] := ML_OrderAdr;
                FooterTxt[6] := "Sell-to Customer Name" + ', ' + "Sell-to City";
            END;

            // Shipping Date if <> Document Date
            IF ("Shipment Date" <> "Document Date") AND ("Shipment Date" <> 0D) THEN BEGIN
                FooterLabel[7] := ML_ShipDate;
                FooterTxt[7] := FORMAT("Shipment Date", 0, 4);
            END;

            CurrGroupPageNO += 1;
            InnerGroupPageNO := 1;
            CurrPageHeaderHiddenFlg := 0;
            CurrPageFooterHiddenFlg := 0;
            CompanyInfo.TESTFIELD("Bank Name");
            FooterLabel[8] := ML_Bank;
            FooterTxt[8] := CompanyInfo."Bank Name" + ', ' + ML_AccNo + ' ' + CompanyInfo."Bank Account No.";

            COMPRESSARRAY(FooterLabel);
            COMPRESSARRAY(FooterTxt);
        END;
    end;
}

