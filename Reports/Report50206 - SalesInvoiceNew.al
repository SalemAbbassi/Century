report 50206 "SalesInvoiceNew"
{
    // version NAVW113.00,NAVDACH13.00,NAVCH13.00
    DefaultLayout = RDLC;
    //RDLCLayout = 'Sales - Invoice.rdl';
    RDLCLayout = 'Sales - Invoice2.rdl';
    Caption = 'Sales - Invoice';
    Permissions = TableData 7190 = rimd;
    PreviewMode = PrintLayout;


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
            column(No_SalesInvHeader; "No.")
            {
            }
            column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
            {
            }
            column(EmailCaption; EMailCaptionLbl)
            {
            }
            column(BilltoCustNo_SalesInvHeaderCaption; "Sales Invoice Header".FIELDCAPTION("Bill-to Customer No."))
            {
            }
            column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
            {
            }
            column(Pos_CaptionH; Pos_Caption)
            {
            }
            column(Desc_SalesInvLineCaptionH; SaleLineDescLbl)//"Sales Line".FIELDCAPTION(Description))
            {
            }
            column(ShipDate_CaptionH; ShipDate_Caption)
            {
            }
            column(Qty_SalesInvLineCaptionH; Qty_Caption)//"Sales Line".FIELDCAPTION(Quantity))
            {
            }
            column(UnitPriceCaptionH; UnitPriceCaptionLbl)
            {
            }
            column(No2_SalesInvLineCaptionH; NoRef_Caption)//"Sales Line".FIELDCAPTION("No."))
            {
            }
            column(VATCaption; VATCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATAmountCaption; VATAmountCaptionLbl)
            {
            }
            column(Qty_Caption; Qty_Caption)//"Sales Line".FIELDCAPTION(Quantity))
            {
            }
            column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
            {
            }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
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
            column(SalesHeaderExtDocNo; "Sales invoice Header"."External Document No.")
            {
            }
            column(SalesHeaderYourRef; "Sales invoice Header"."Your Reference")
            {
            }
            column(SalesHeaderOurRef; recUser."Full Name")
            {
            }
            column(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
            {
            }
            column(Shipment_Method_Code; "Shipment Method Code")
            {
            }
            column(Carryover_Caption; Carryoverlbl)
            {
            }
            column(AmountCaptionH; AmountCaptionLbl + AmountCaptionTxt)
            {
            }
            column(intCountComment; intCountComment)
            {

            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(DocumentCaptionCopyText; DocumentCaption)
                    {
                    }
                    column(OrderConfirmCopyCaption; Text004)//CopyText)
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
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfoPhNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
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
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(PaymentTermsDescription; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(BilltoCustNo_SalesInvHeader; "Sales Invoice Header"."Bill-to Customer No.")
                    {
                    }
                    column(PricesInclVAT_SalesInvHeaderCaption; "Sales invoice Header".FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(PostingDate_SalesInvHdr; FORMAT("Sales Invoice Header"."Posting Date", 0, '<Day,2>.<Month,2>.<Year4>'))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesInvHeader; "Sales Invoice Header"."VAT Registration No.")
                    {
                    }
                    column(ShptDate_SalesInvHeader; FORMAT("Sales Invoice Header"."Shipment Date"))
                    {
                    }
                    column(DueDate_SalesInvHeader; FORMAT("Sales Invoice Header"."Due Date", 0, '<Day,2>.<Month,2>.<Year4>'))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(SalesInvoiceReference_InvoiceHeader; "Sales Invoice Header"."External Document No.")
                    {
                    }
                    column(YourReference_SalesInvHdr; "Sales Invoice Header"."Your Reference")
                    {
                    }

                    column(Desc_SalesInvLineCaption; SaleLineDescLbl)//"Sales Line".FIELDCAPTION(Description))
                    {
                    }

                    column(Qty_SalesInvLineCaption; Qty_Caption)//"Sales Line".FIELDCAPTION(Quantity))
                    {
                    }

                    column(No2_SalesInvLineCaption; NoRef_Caption)//"Sales Line".FIELDCAPTION("No."))
                    {
                    }

                    column(OrderNoText; OrderNoText)
                    {
                    }
                    column(SalesOrderReference_SalesInvHeader; "Sales Invoice Header"."Order No.")
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
                    column(DocDate_SalesInvHeader; FORMAT("Sales Invoice Header"."Document Date", 0, '<Day,2>.<Month,2>.<Year4>'))
                    {
                    }
                    column(PricesInclVAT_SalesInvHeader; "Sales Invoice Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo_SalesInvHeader; FORMAT("Sales Invoice Header"."Prices Including VAT"))
                    {
                    }
                    column(PageCaption; PageCaptionCap)//STRSUBSTNO(Text005, ''))
                    {
                    }
                    column(PmntTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(ShptMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(CompanyInfoRegNo; CompanyInfo.GetRegistrationNumber)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
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
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccountNoCaption; lblBankName) //BankAccountNoCaptionLbl)
                    {
                    }
                    column(DueDateCaption; DueDateCaptionLbl)
                    {
                    }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl)
                    {
                    }
                    column(PostingDateCaption; PostingDateCaptionLbl)
                    {
                    }
                    column(RegNoCaption; CompanyInfo.GetRegistrationNumberLbl)
                    {
                    }
                    column(PricesInclVAT_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Prices Including VAT"))
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
                    column(CustomerNoCaption; ML_CustomerNo)
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
                    column(SalesHeaderSellCustNoLbl; SalesInvoiceHeaderSellCustNoLbl)
                    {
                    }
                    column(SalesHeaderSellCustNo; "Sales Invoice Header"."Sell-to Customer No.")
                    {
                    }
                    column(CompanyInfoSwiftCode; CompanyInfo."SWIFT Code")
                    {

                    }
                    column(CompanyInfoSwiftLbl; lblSwiftCode)
                    {

                    }
                    column(CompanyInfoIBAN; CompanyInfo.IBAN)
                    {

                    }
                    column(CompanyInfoIBANLbl; lblIBAN)
                    {

                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number_Integer; Number)
                        {
                        }
                        column(DimensionsCaption; DimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
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
                    dataitem(SalesCommentLine; "Sales Comment Line")
                    {

                        //DataItemLinkReference = "Sales Invoice Header";
                        //DataItemLink = "No." = field("No."), "Document Type" = Const(7), "Document Line No." = const(0) ;
                        //DataItemTableView = WHERE("Document Type"= )
                        column(Comment; Comment)
                        {

                        }
                        trigger OnPreDataItem()
                        begin
                            SetFilter("Document Type", '%1', SalesCommentLine."Document Type"::"Posted Invoice");
                            SetFilter("No.", '%1', "Sales Invoice Header"."No.");
                            SetFilter("Document Line No.", '%1', 0);
                            if not FindSet then
                                CurrReport.Skip();

                        end;
                    }
                    dataitem("Sales Invoice Line"; integer)//"Sales Invoice Line")
                    {
                        /*
                        DataItemLink = "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING ("Document No.", "Line No.");
                        */
                        column(LineAmt_SalesInvoiceLine; recSalesInvoiceLineTMP."Line Amount") //"Line Amount")
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesInvLine; recSalesInvoiceLineTMP.Description) //Description)
                        {
                        }
                        column(NNCSalesInvLineLineAmt; NNCSalesLineLineAmt)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCSalesInvLineInvDiscAmt; NNCSalesLineInvDiscAmt)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalLCY; NNCTotalLCY)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalExclVAT; NNCTotalExclVAT)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCVATAmt; NNCVATAmt)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalInclVAT; NNCTotalInclVAT)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCPmtDiscOnVAT; NNCPmtDiscOnVAT)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalInclVAT2; NNCTotalInclVAT2)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCVATAmt2; NNCVATAmt2)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(NNCTotalExclVAT2; NNCTotalExclVAT2)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Type_SalesInvLine; format(recSalesInvoiceLineTMP.type))//FORMAT("Sales invoice Line".Type))
                        {
                        }
                        column(No_SalesInvLine; recSalesInvoiceLineTMP."Line No.") //"line No.")
                        {
                        }
                        column(AsmInfoExistsForLine; AsmInfoExistsForLine)
                        {
                        }
                        column(Quantity_SalesInvoiceLine; recSalesInvoiceLineTMP.Quantity) //Quantity)
                        {
                        }
                        column(UOM_SalesInvoiceLine; recSalesInvoiceLineTMP."Unit of Measure") //"Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesInvLine; recSalesInvoiceLineTMP."Unit Price") //"Unit Price")
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;//2;
                        }
                        column(LineDisc_SalesInvoiceLine; recSalesInvoiceLineTMP."Line Discount %") //"Line Discount %")
                        {
                        }
                        column(LineAmt_SalesInvLine; recSalesInvoiceLineTMP."Line Amount") //"Sales invoice Line"."Line Amount")
                        {
                            AutoFormatExpression = "Sales invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SubtotalNet_SalesInvLine; -1)//recSalesInvoiceLineTMP."Subtotal net") //"Sales Invoice Line"."Subtotal Net")
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode; //GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VAT_SalesInvLine; recSalesInvoiceLineTMP."VAT %") //"VAT %")
                        {
                        }
                        column(PostedShipmentDate; format(recSalesInvoiceLineTMP."Shipment Date")) //FORMAT("Shipment Date"))
                        {
                        }
                        column(SalesLineType; format(recSalesInvoiceLineTMP.Type)) //FORMAT(Type))
                        {
                        }
                        column(Qty_SalesInvLine2; Qty_TxtVal)//FORMAT("Sales Line".Quantity,0,'<Precision,0:0><Standard Format,2>'))//"Sales Line".Quantity)
                        {
                        }
                        column(SalesLineTypeInt; format(recSalesInvoiceLineTMP.type, 0, 2)) //FORMAT(Type, 0, 2))
                        {
                        }
                        column(InvDiscountAmount; -recSalesInvoiceLineTMP."Inv. Discount Amount") //-"Inv. Discount Amount")
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvoiceDiscountAmt; TotalInvoiceDiscountAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(Amount_SalesInvoiceLine; recSalesInvoiceLineTMP.Amount) //Amount)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalAmount; TotalAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountIncludingVATAmount; recSalesInvoiceLineTMP."Amount Including VAT" - recSalesInvoiceLineTMP.Amount) //"Amount Including VAT" - Amount)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtInclVAT_SalesInvLine; recSalesInvoiceLineTMP."Amount Including VAT") //"Amount Including VAT")
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(VATAmtLineVATAmtText3; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalInclVATText; TotalVATLbl + AmountCaptionTxt)//TotalInclVATText)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }

                        column(TotalAmountVAT; TotalAmountVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseDisc_SalesInvHeader; "Sales Invoice Header"."VAT Base Discount %")
                        {
                            AutoFormatType = 1;
                        }
                        column(DisplayAssemblyInfo; DisplayAssemblyInformation)
                        {
                        }

                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(No2_SalesInvLine; recSalesInvoiceLineTMP."Description 2")// "Sales invoice Line"."Description 2")
                        {
                        }
                        column(Qty_SalesInvLine; recSalesInvoiceLineTMP.Quantity) //"Sales invoice Line".Quantity)
                        {
                        }
                        column(TotalPaymentDiscountOnVAT; TotalPaymentDiscountOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(LineNo_SalesInvoiceLine; recSalesInvoiceLineTMP."Line No.")// "Line No.")
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(DiscountCaption; DiscountCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl + AmountCaptionTxt)
                        {
                        }
                        column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscountVATCaption; PaymentDiscVATCaptionLbl)
                        {
                        }
                        column(Description_SalesInvLineCaption; recSalesInvoiceLineTMP.FieldCaption(Description)) //FIELDCAPTION(Description))
                        {
                        }
                        column(No2_SalesInvoiceLineCaption; NoRef_Caption)//"Sales Line".FIELDCAPTION("No."))
                        {
                        }
                        column(FormatCurrencyVal; intFormatCurrencyVal)
                        {
                        }
                        column(No_SalesInvoiceLineCaption; recSalesInvoiceLineTMP.FIELDCAPTION("No."))
                        {
                        }
                        column(Quantity_SalesInvoiceLineCaption; recSalesInvoiceLineTMP.FIELDCAPTION(Quantity))
                        {
                        }
                        column(UOM_SalesInvoiceLineCaption; recSalesInvoiceLineTMP.FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(VAT_SalesInvLineCaption; recSalesInvoiceLineTMP.FIELDCAPTION("VAT %"))
                        {
                        }
                        column(SubtotalNet_SalesInvoiceLine; -1)//recSalesInvoiceLineTMP."Subtotal net")
                        {
                        }
                        column(NewPageGroupNo; NewPageGroupNo)
                        {
                        }
                        column(NewPageLine; NewPageLine)
                        {
                        }
                        column(IsLineWithTotals; LineNoWithTotal = recSalesInvoiceLineTMP."Line No.")
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
                        column(extref; recSalesInvoiceLineTMP.ExtRef) //"Sales invoice Line".ExtRef)
                        {
                        }
                        column(NNCSalesInvLineLineAmtItemSrv; NNCSalesLineLineAmtItemSrv)
                        {
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(formatDecimal; cduFormatMgt.getRDLFormatDecimalPlace("Sales Invoice Header"."Currency Code"))
                        {

                        }
                        column(LanguageCode; cduFormatMgt.getRDLLangueCode("Sales Invoice Header"."Currency Code"))
                        {
                        }
                        dataitem("Sales Shipment Buffer"; Integer)
                        {
                            DataItemTableView = SORTING(Number);
                            column(SalesShpBufferPostingDate; FORMAT(SalesShipmentBuffer."Posting Date"))
                            {
                            }
                            column(SalesShpBufferQuantity; SalesShipmentBuffer.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(ShipmentCaption; ShipmentCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN
                                    SalesShipmentBuffer.FIND('-')
                                ELSE
                                    SalesShipmentBuffer.NEXT;


                            end;

                            trigger OnPreDataItem()
                            begin
                                SalesShipmentBuffer.SETRANGE("Document No.", recSalesInvoiceLineTMP."Document No.");// "Sales Invoice Line"."Document No.");
                                SalesShipmentBuffer.SETRANGE("Line No.", recSalesInvoiceLineTMP."Line No.");// "Sales Invoice Line"."Line No.");

                                SETRANGE(Number, 1, SalesShipmentBuffer.COUNT);
                            end;
                        }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));
                            column(DimText2; DimText)
                            {
                            }
                            column(LineDimCaption; LineDimensionsCaptionLbl)
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

                                DimSetEntry2.SETRANGE("Dimension Set ID", recSalesInvoiceLineTMP."Dimension Set ID");
                            end;
                        }
                        dataitem(AsmLoop; Integer)
                        {
                            column(AsmLineType; TempPostedAsmLine.Type)
                            {
                            }
                            column(AsmLineNo; BlanksForIndent + TempPostedAsmLine."No.")
                            {
                            }
                            column(AsmLineUOMText; GetUOMText(TempPostedAsmLine."Unit of Measure Code"))
                            {
                            }
                            column(AsmLineQuantity; TempPostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(TempPostedAsmLineVariantCode; BlanksForIndent + TempPostedAsmLine."Variant Code")
                            {
                            }
                            column(AsmLineDescription; BlanksForIndent + TempPostedAsmLine.Description)
                            {
                            }

                            trigger OnAfterGetRecord()
                            var
                                ItemTranslation: Record "Item Translation";
                            begin
                                IF Number = 1 THEN
                                    TempPostedAsmLine.FINDSET
                                ELSE
                                    TempPostedAsmLine.NEXT;

                                IF ItemTranslation.GET(TempPostedAsmLine."No.",
                                     TempPostedAsmLine."Variant Code",
                                     "Sales Invoice Header"."Language Code")
                                THEN
                                    TempPostedAsmLine.Description := ItemTranslation.Description;
                            end;

                            trigger OnPreDataItem()
                            begin
                                CLEAR(TempPostedAsmLine);
                                IF NOT DisplayAssemblyInformation THEN
                                    CurrReport.BREAK;
                                CollectAsmInformation;
                                CLEAR(TempPostedAsmLine);
                                SETRANGE(Number, 1, TempPostedAsmLine.COUNT);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            recItem: record item;
                            recSalesLine: Record "sales invoice line";
                            recSalesLine2: Record "sales invoice line";
                            recExtTextHeader: Record "Extended Text Header";
                            RecExtTextLine: Record "Extended Text Line";
                        begin
                            IF Number = 1 THEN begin
                                recSalesInvoiceLineTMP.FIND('-');
                                if recSalesInvoiceLineTMP.type = recSalesInvoiceLineTMP.type::" " then
                                    lineNoNotVisible := -1;
                            end
                            ELSE
                                recSalesInvoiceLineTMP.NEXT;

                            if recSalesInvoiceLineTMP.type = recSalesInvoiceLineTMP.type::item then begin
                                //if Quantity = 0 then
                                //    CurrReport.Skip();
                                if recSalesInvoiceLineTMP.Quantity <> 0 then
                                    recSalesInvoiceLineTMP."Unit Price" := recSalesInvoiceLineTMP."Line Amount" / recSalesInvoiceLineTMP.Quantity;
                                txtDesc2 := recSalesInvoiceLineTMP.ExtRef;
                                xintAttacheLineNo := -1;
                                recSalesLine.SetFilter("Document No.", '%1', recSalesInvoiceLineTMP."Document No.");
                                recSalesLine.SetFilter("Attached to Line No.", '%1', recSalesInvoiceLineTMP."Line No.");
                                if recSalesLine.Findfirst then begin
                                    recExtTextHeader.SETRANGE("Table Name", recSalesInvoiceLineTMP.Type);
                                    recExtTextHeader.SETRANGE("No.", recSalesInvoiceLineTMP."No.");
                                    recExtTextHeader.SETRANGE("Sales Invoice", TRUE);
                                    recExtTextHeader.SETCURRENTKEY(
                                        "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                                    recExtTextHeader.SETRANGE("Starting Date", 0D, "Sales invoice Header"."Document Date");
                                    recExtTextHeader.SETFILTER("Ending Date", '%1..|%2', "Sales invoice Header"."Document Date", 0D);
                                    IF "Sales invoice Header"."Language Code" = '' THEN
                                        recExtTextHeader.SETRANGE("Language Code", '')
                                    else
                                        recExtTextHeader.SETRANGE("Language Code", "Sales invoice Header"."Language Code");
                                    if recExtTextHeader.FindFirst() then begin
                                        //"No." := recExtTextHeader.Description;
                                        recSalesInvoiceLineTMP."Description 2" := recExtTextHeader.Description;
                                        recSalesInvoiceLineTMP.Description := recSalesLine.Description;
                                    end
                                    else
                                        recSalesInvoiceLineTMP."Description 2" := recSalesInvoiceLineTMP."No.";
                                end
                                else begin
                                    recExtTextHeader.SETRANGE("Table Name", recSalesInvoiceLineTMP.Type);
                                    recExtTextHeader.SETRANGE("No.", recSalesInvoiceLineTMP."No.");
                                    recExtTextHeader.SETRANGE("Sales Invoice", TRUE);
                                    recExtTextHeader.SETCURRENTKEY(
                                        "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                                    recExtTextHeader.SETRANGE("Starting Date", 0D, "Sales invoice Header"."Document Date");
                                    recExtTextHeader.SETFILTER("Ending Date", '%1..|%2', "Sales invoice Header"."Document Date", 0D);
                                    IF "Sales invoice Header"."Language Code" = '' THEN
                                        recExtTextHeader.SETRANGE("Language Code", '')
                                    else
                                        recExtTextHeader.SETRANGE("Language Code", "Sales invoice Header"."Language Code");
                                    if recExtTextHeader.FindFirst() then
                                        recSalesInvoiceLineTMP."Description 2" := recExtTextHeader.Description
                                    else
                                        recSalesInvoiceLineTMP."Description 2" := recSalesInvoiceLineTMP."No.";
                                end;
                            end
                            else
                                if (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.type::" ") and (recSalesInvoiceLineTMP."Attached to Line No." > 0) and
                                 (recSalesInvoiceLineTMP."Attached to Line No." <> xintAttacheLineNo) then begin
                                    xintAttacheLineNo := recSalesInvoiceLineTMP."Attached to Line No.";
                                    CurrReport.Skip();
                                end
                                else
                                    if (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.type::" ") and (recSalesInvoiceLineTMP."Attached to Line No." > 0) and
                                       (recSalesInvoiceLineTMP."Attached to Line No." = xintAttacheLineNo) and (txtDesc2 <> '') then begin
                                        recSalesInvoiceLineTMP.ExtRef := txtDesc2;
                                        txtDesc2 := '';

                                    end;
                            //<<
                            if recSalesInvoiceLineTMP.Quantity > 0 then
                                lineNoNotVisible := -1
                            else
                                if (recSalesInvoiceLineTMP.Quantity <= 0) and (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.type::Item) then begin
                                    lineNoNotVisible := recSalesInvoiceLineTMP."Line No.";
                                    CurrReport.Skip();
                                end;

                            if (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.type::" ") and (recSalesInvoiceLineTMP."Attached to Line No." = lineNoNotVisible) then
                                CurrReport.Skip();

                            if (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.type::" ") and (recSalesInvoiceLineTMP."Attached to Line No." = 0) and (lineNoNotVisible > 0) then
                                CurrReport.Skip();

                            Pos_Valuetxt := '';
                            ShipDate_ValueTxt := '';
                            if (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.Type::Item) then
                                if recItem.Get(recSalesInvoiceLineTMP."No.") then
                                    if recItem.Type <> recItem.Type::Service then begin
                                        Pos_Value += 1;
                                        Pos_Valuetxt := format(Pos_Value);
                                        ShipDate_ValueTxt := Format(recSalesInvoiceLineTMP."Shipment Date", 0, '<Day,2>.<Month,2>.<Year4>');
                                    end;
                            if (recSalesInvoiceLineTMP.Quantity = 0) or ((recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.Type::Item) AND (recItem.Get(recSalesInvoiceLineTMP."No.")) and (recItem.Type = recItem.Type::Service)) then
                                Qty_TxtVal := ''
                            else begin

                                Qty_TxtVal := FORMAT(recSalesInvoiceLineTMP.Quantity, 0, '<Precision,0:0><Standard Format,2>');

                                TotQty_Val += recSalesInvoiceLineTMP.Quantity;
                                TotQty_TxtVal := FORMAT(TotQty_Val, 0, '<Precision,0:0><Standard Format,2>');
                            end;

                            IF DisplayAssemblyInformation THEN
                                AsmInfoExistsForLine := TempPostedAsmLine.COUNT > 0;

                            InitializeShipmentBuffer;
                            IF (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                recSalesInvoiceLineTMP."No." := '';

                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := recSalesInvoiceLineTMP."VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := recSalesInvoiceLineTMP."VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := recSalesInvoiceLineTMP."Tax Group Code";
                            VATAmountLine."VAT %" := recSalesInvoiceLineTMP."VAT %";
                            VATAmountLine."VAT Base" := recSalesInvoiceLineTMP.Amount;
                            VATAmountLine."Amount Including VAT" := recSalesInvoiceLineTMP."Amount Including VAT";
                            VATAmountLine."Line Amount" := recSalesInvoiceLineTMP."Line Amount";
                            IF recSalesInvoiceLineTMP."Allow Invoice Disc." THEN
                                VATAmountLine."Inv. Disc. Base Amount" := recSalesInvoiceLineTMP."Line Amount";
                            VATAmountLine."Invoice Discount Amount" := recSalesInvoiceLineTMP."Inv. Discount Amount";
                            VATAmountLine."VAT Clause Code" := recSalesInvoiceLineTMP."VAT Clause Code";
                            VATAmountLine.InsertLine;
                            CalcVATAmountLineLCY(
                              "Sales Invoice Header", VATAmountLine, TempVATAmountLineLCY,
                              VATBaseRemainderAfterRoundingLCY, AmtInclVATRemainderAfterRoundingLCY);

                            TotalSubTotal += recSalesInvoiceLineTMP."Line Amount";
                            TotalInvoiceDiscountAmt -= recSalesInvoiceLineTMP."Inv. Discount Amount";
                            TotalAmount += recSalesInvoiceLineTMP.Amount;
                            TotalAmountVAT += recSalesInvoiceLineTMP."Amount Including VAT" - recSalesInvoiceLineTMP.Amount;
                            TotalAmountInclVAT += recSalesInvoiceLineTMP."Amount Including VAT";
                            TotalPaymentDiscountOnVAT += -(recSalesInvoiceLineTMP."Line Amount" - recSalesInvoiceLineTMP."Inv. Discount Amount" - recSalesInvoiceLineTMP."Amount Including VAT");


                            if (recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.Type::Item) AND (recItem.Get(recSalesInvoiceLineTMP."No.")) and (recItem.Type = recItem.Type::Service) then begin
                                recExtTextHeader.SETRANGE("Table Name", recSalesInvoiceLineTMP.Type);
                                recExtTextHeader.SETRANGE("No.", recSalesInvoiceLineTMP."No.");
                                recExtTextHeader.SETRANGE("Sales Order", TRUE);
                                recExtTextHeader.SETCURRENTKEY(
                                    "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                                recExtTextHeader.SETRANGE("Starting Date", 0D, "Sales Invoice Header"."Document Date");
                                recExtTextHeader.SETFILTER("Ending Date", '%1..|%2', "Sales Invoice Header"."Document Date", 0D);
                                IF "Sales Invoice Header"."Language Code" = '' THEN
                                    recExtTextHeader.SETRANGE("Language Code", '')
                                else
                                    recExtTextHeader.SETRANGE("Language Code", "Sales Invoice Header"."Language Code");
                                if recExtTextHeader.FindFirst() then begin
                                    RecExtTextLine.SETRANGE("Table Name", recSalesInvoiceLineTMP.Type);
                                    RecExtTextLine.SETRANGE("No.", recSalesInvoiceLineTMP."No.");
                                    IF "Sales Invoice Header"."Language Code" = '' THEN
                                        RecExtTextLine.SETRANGE("Language Code", '')
                                    else
                                        RecExtTextLine.SETRANGE("Language Code", "Sales Invoice Header"."Language Code");
                                    RecExtTextLine.setfilter("Text No.", '%1', recExtTextHeader."Text No.");
                                    if RecExtTextLine.FindFirst() then
                                        recSalesInvoiceLineTMP.Description := RecExtTextLine.Text
                                    else
                                        recSalesInvoiceLineTMP.Description := recExtTextHeader.Description;
                                end;
                                recSalesLineItemServiceTMP.TransferFields(recSalesInvoiceLineTMP);//"Sales invoice Line");
                                recSalesLineItemServiceTMP.Insert(false);

                                NNCSalesLineLineAmtItemSrv += recSalesInvoiceLineTMP."Line Amount";
                                NNCSalesLineInvDiscAmt += recSalesInvoiceLineTMP."Inv. Discount Amount";

                                NNCTotalLCY := NNCSalesLineLineAmt + NNCSalesLineLineAmtItemSrv - NNCSalesLineInvDiscAmt;

                                NNCTotalExclVAT := NNCTotalLCY;
                                NNCVATAmt := VATAmountLine.GetTotalVATAmount;
                                NNCTotalInclVAT := NNCTotalLCY - NNCVATAmt;

                                NNCPmtDiscOnVAT := -VATAmountLine.GetTotalVATDiscount("Sales invoice Header"."Currency Code", "Sales invoice Header"."Prices Including VAT");
                                ;

                                NNCTotalInclVAT2 := TotalAmountInclVAT;

                                NNCVATAmt2 := VATAmountLine.GetTotalVATAmount;
                                NNCTotalExclVAT2 := VATAmountLine.GetTotalVATBase;
                                //if confirm(format(NNCSalesLineLineAmtItemSrv) + ' / ' + format(NNCTotalLCY)) then
                                //    Error('cancel');
                                //CurrReport.Skip();
                                recSalesInvoiceLineTMP."No." := '';
                                recSalesInvoiceLineTMP.Description := '';
                                recSalesInvoiceLineTMP."Description 2" := '';
                                recSalesInvoiceLineTMP.Quantity := 0;
                                recSalesInvoiceLineTMP."Line Amount" := 0;
                                recSalesInvoiceLineTMP."Unit Price" := 0;
                            end
                            else begin

                                NNCSalesLineLineAmt += recSalesInvoiceLineTMP."Line Amount";
                                NNCSalesLineInvDiscAmt += recSalesInvoiceLineTMP."Inv. Discount Amount";

                                NNCTotalLCY := NNCSalesLineLineAmt + NNCSalesLineLineAmtItemSrv - NNCSalesLineInvDiscAmt;

                                NNCTotalExclVAT := NNCTotalLCY;
                                NNCVATAmt := VATAmountLine.GetTotalVATAmount;
                                NNCTotalInclVAT := NNCTotalLCY - NNCVATAmt;

                                NNCPmtDiscOnVAT := -VATAmountLine.GetTotalVATDiscount("Sales invoice Header"."Currency Code", "Sales invoice Header"."Prices Including VAT");

                                NNCTotalInclVAT2 := TotalAmountInclVAT;

                                NNCVATAmt2 := VATAmountLine.GetTotalVATAmount;
                                NNCTotalExclVAT2 := VATAmountLine.GetTotalVATBase;
                            end;
                            Sales_Nu_Type := recSalesInvoiceLineTMP.Type;
                            //Sales_Nu_Type_Title := recSalesInvoiceLineTMP.Type::Title;

                            //NewPageLine := recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.Type::"New Page";
                            IF NewPageLine THEN BEGIN
                                CurrPageFooterHiddenFlg := 1;
                                NewPageGroupNo += 1;
                            END ELSE
                                CurrPageFooterHiddenFlg := 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            VATAmountLine.DELETEALL;
                            TempVATAmountLineLCY.DELETEALL;
                            VATBaseRemainderAfterRoundingLCY := 0;
                            AmtInclVATRemainderAfterRoundingLCY := 0;
                            SalesShipmentBuffer.RESET;
                            SalesShipmentBuffer.DELETEALL;
                            FirstValueEntryNo := 0;
                            /*
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (recSalesInvoiceLineTMP.Description = '') AND (recSalesInvoiceLineTMP."No." = '') AND (recSalesInvoiceLineTMP.Quantity = 0) AND (recSalesInvoiceLineTMP.Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            LineNoWithTotal := recSalesInvoiceLineTMP."Line No.";
                            recSalesInvoiceLineTMP.SETRANGE("Line No.", 0, recSalesInvoiceLineTMP."Line No.");
                            */
                            SetRange(number, 1, recSalesInvoiceLineTMP.Count());

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
                            AutoFormatExpression = recSalesInvoiceLineTMP.GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVATAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineLineAmount; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscountAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVAT; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmntSpecificCaption; VATAmntSpecificCaptionLbl)
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(LineAmountCaption; LineAmountCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                        end;
                    }
                    dataitem(VATClauseEntryCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATClauseVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATClauseCode; VATAmountLine."VAT Clause Code")
                        {
                        }
                        column(VATClauseDescription; VATClause.Description)
                        {
                        }
                        column(VATClauseDescription2; VATClause."Description 2")
                        {
                        }
                        column(VATClauseAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATClausesCaption; VATClausesCap)
                        {
                        }
                        column(VATClauseVATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }
                        column(VATClauseVATAmtCaption; VATAmountCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            IF NOT VATClause.GET(VATAmountLine."VAT Clause Code") THEN
                                CurrReport.SKIP;
                            VATClause.TranslateDescription("Sales Invoice Header"."Language Code");
                        end;

                        trigger OnPreDataItem()
                        begin
                            CLEAR(VATClause);
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                        end;
                    }
                    dataitem(VatCounterLCY; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALExchRate; VALExchRate)
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
                        column(VATAmountLineVAT_VatCounterLCY; TempVATAmountLineLCY."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier_VatCounterLCY; TempVATAmountLineLCY."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            TempVATAmountLineLCY.GetLine(Number);
                            VALVATBaseLCY := TempVATAmountLineLCY."VAT Base";
                            VALVATAmountLCY := TempVATAmountLineLCY."Amount Including VAT" - TempVATAmountLineLCY."VAT Base";
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Sales Invoice Header"."Currency Code" = '')
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code", 1);
                            CalculatedExchRate := ROUND(1 / "Sales Invoice Header"."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := STRSUBSTNO(Text009, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(PaymentReportingArgument; "Payment Reporting Argument")
                    {
                        DataItemTableView = SORTING(Key);
                        UseTemporary = true;
                        column(PaymentServiceLogo; Logo)
                        {
                        }
                        column(PaymentServiceURLText; "URL Caption")
                        {
                        }
                        column(PaymentServiceURL; GetTargetURL)
                        {
                        }

                        trigger OnPreDataItem()
                        var
                            PaymentServiceSetup: Record "Payment Service Setup";
                        begin
                            PaymentServiceSetup.CreateReportingArgs(PaymentReportingArgument, "Sales Invoice Header");
                            IF ISEMPTY THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(SellToCustNo_SalesInvHdr; "Sales Invoice Header"."Sell-to Customer No.")
                        {
                        }
                        column(SellToCustNo_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowShippingAddr THEN
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
                    dataitem(LineFee; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            ORDER(Ascending)
                                            WHERE(Number = FILTER(1 ..));
                        column(LineFeeCaptionLbl; TempLineFeeNoteOnReportHist.ReportText)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF NOT DisplayAdditionalFeeNote THEN
                                CurrReport.BREAK;

                            IF Number = 1 THEN BEGIN
                                IF NOT TempLineFeeNoteOnReportHist.FINDSET THEN
                                    CurrReport.BREAK
                            END ELSE
                                IF TempLineFeeNoteOnReportHist.NEXT = 0 THEN
                                    CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                var
                    recSalesInvLine: record "Sales Invoice Line";
                    recTrackingLine: Record "Reservation Entry";
                    txtSerialInfos: array[100] of Text[50];
                    inttab: Integer;
                    recSalesLineTMP: Record "Sales Invoice Line" temporary;
                    intlineNoSrc: Integer;
                    intlineToInsert: Integer;
                    ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
                    ItemTrackingMgt: Codeunit "Item Tracking Management";
                    recTempItemLedgEntry: Record "Item Ledger Entry" temporary;
                    txt1: text[250];
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    END;
                    //CurrReport.PAGENO := 1;

                    TotalSubTotal := 0;
                    TotalInvoiceDiscountAmt := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscountOnVAT := 0;
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
                    intlineToInsert := -1;
                    recSalesInvoiceLineTMP.DeleteAll();
                    recSalesLineTMP.deleteall();
                    clear(txtSerialInfos);
                    recSalesInvLine.reset;
                    recSalesInvLine.setfilter("Document No.", '%1', "Sales Invoice Header"."No.");
                    if recSalesInvLine.FindSet() then
                        repeat
                            if recSalesInvLine.Type in [recSalesInvLine.Type::Item, recSalesInvLine.type::"G/L Account", recSalesInvLine.Type::Resource, recSalesInvLine.Type::"Fixed Asset", recSalesInvLine.Type::"Charge (Item)"] then begin
                                if recSalesInvLine.Quantity > 0 then begin
                                    recSalesInvoiceLineTMP.TransferFields(recSalesInvLine);
                                    recSalesInvoiceLineTMP.Insert(false);
                                    intlineToInsert := recSalesInvLine."Line No.";
                                end
                                else
                                    intlineToInsert := -1;
                            end
                            else begin
                                if ((recSalesInvLine."Attached to Line No." > 0) and (recSalesInvLine."Attached to Line No." = intlineToInsert)) or (recSalesInvLine."Attached to Line No." = 0) then begin
                                    recSalesInvoiceLineTMP.TransferFields(recSalesInvLine);
                                    recSalesInvoiceLineTMP.Insert(false);
                                end;
                            end;

                        until recSalesInvLine.Next() = 0;

                    if recSalesInvoiceLineTMP.FindSet() then
                        repeat
                            if recSalesInvoiceLineTMP.Type = recSalesInvoiceLineTMP.Type::Item then begin
                                if CompressArray(txtSerialInfos) > 0 then begin
                                    for inttab := 1 to CompressArray(txtSerialInfos) do begin
                                        //if Confirm(format(intlineNoSrc) + ' / ' + format(inttab)) then
                                        //    error('cancel');
                                        recSalesLineTMP.init();
                                        recSalesLineTMP."Document No." := recSalesInvoiceLineTMP."Document No.";
                                        recSalesLineTMP."Line No." := intlineNoSrc + (inttab * 100);
                                        recSalesLineTMP.Insert(false);
                                        recSalesLineTMP.Type := recSalesLineTMP.Type::" ";
                                        recSalesLineTMP.Description := txtSerialInfos[inttab];
                                        recSalesLineTMP.Modify(false);
                                    end;
                                end;
                                intlineNoSrc := recSalesInvoiceLineTMP."Line No.";
                                recTempItemLedgEntry.Deleteall();
                                txt1 := ItemTrackingMgt.ComposeRowID(DATABASE::"Sales Invoice Line", 0, recSalesInvoiceLineTMP."Document No.", '', 0, recSalesInvoiceLineTMP."Line No.");
                                RetrieveEntriesFromPostedInv(recTempItemLedgEntry, txt1);
                                clear(txtSerialInfos);
                                if recTempItemLedgEntry.FindSet() then begin
                                    inttab := 1;
                                    txtSerialInfos[inttab] := txtSerialInfosLbl + ' ';
                                    repeat
                                        if strlen(txtSerialInfos[inttab] + recTempItemLedgEntry."Serial No." + ', ') > 50 then begin
                                            inttab += 1;
                                            txtSerialInfos[inttab] := recTempItemLedgEntry."Serial No." + ', ';
                                        end
                                        else
                                            txtSerialInfos[inttab] += recTempItemLedgEntry."Serial No." + ', '
                                    until recTempItemLedgEntry.Next() = 0;
                                end;

                            end
                            else
                                intlineNoSrc := recSalesInvoiceLineTMP."Line No.";

                        until recSalesInvoiceLineTMP.Next() = 0;

                    if CompressArray(txtSerialInfos) > 0 then begin
                        for inttab := 1 to CompressArray(txtSerialInfos) do begin
                            recSalesLineTMP.init();
                            recSalesLineTMP."Document No." := "Sales invoice Header"."No.";
                            recSalesLineTMP."Line No." := intlineNoSrc + (inttab * 100);
                            recSalesLineTMP.Insert(false);
                            recSalesLineTMP.Type := recSalesLineTMP.Type::" ";

                            recSalesLineTMP.Description := txtSerialInfos[inttab];
                            recSalesLineTMP.Modify(false);
                        end;
                    end;
                    if recSalesLineTMP.FindSet() then
                        repeat
                            recSalesInvoiceLineTMP.TransferFields(recSalesLineTMP);
                            recSalesInvoiceLineTMP.Insert(false);
                        until recSalesLineTMP.Next() = 0;
                    if recSalesInvoiceLineTMP.FindSet() then;
                end;

                trigger OnPostDataItem()
                begin
                    IF NOT IsReportInPreviewMode THEN
                        CODEUNIT.RUN(CODEUNIT::"Sales Inv.-Printed", "Sales Invoice Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + Cust."Invoice Copies" + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                Handled: Boolean;
                txtTMP: text;
                recSalesLineComment: Record "Sales Comment Line";
            begin
                intCountComment := 0;
                recSalesLineComment.SetFilter("Document Type", '%1', SalesCommentLine."Document Type"::"Posted Invoice");
                recSalesLineComment.SetFilter("No.", '%1', "Sales Invoice Header"."No.");
                recSalesLineComment.SetFilter("Document Line No.", '%1', 0);
                if recSalesLineComment.FindSet then
                    intCountComment := recSalesLineComment.Count();

                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                if not recTransportMethod.Get("Sales invoice Header"."Transport Method") then
                    recTransportMethod.init;

                recUser.SetCurrentKey("User Name");
                recUser.SetFilter("User Name", '%1', "Sales invoice Header"."User ID");
                if not recUser.FindFirst() then
                    recUser.Init();

                if recCurrency.get("Sales invoice Header"."Currency Code") then begin
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
                if "Language Code" <> '' then
                    CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                "Sales invoice Header"."Bill-to Contact" := '';
                "Sales invoice Header"."Sell-to Contact" := '';
                "Sales invoice Header"."Ship-to Contact" := '';
                "Sales invoice Header"."Bill-to Contact No." := '';
                "Sales invoice Header"."Sell-to Contact No." := '';

                //>>04.03.2019
                if not DBEBooPrintName then begin
                    "Sales Invoice Header"."Sell-to Customer Name" := '';
                    "Sales Invoice Header"."Bill-to Name" := '';
                    "Sales Invoice Header"."Ship-to Name" := '';
                end;
                //<<04.03.2019

                FormatAddressFields("Sales invoice Header");
                FormatDocumentFields("Sales invoice Header");

                PrepareHeader;
                PrepareFooter;

                FormatAddressFields("Sales Invoice Header");
                FormatDocumentFields("Sales Invoice Header");

                IF NOT Cust.GET("Bill-to Customer No.") THEN
                    CLEAR(Cust);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                GetLineFeeNoteOnReportHist("No.");

            end;

            trigger OnPreDataItem()
            begin
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
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                    field(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Additional Fee Note';
                        ToolTip = 'Specifies that any notes about additional fees are included on the document.';
                    }
                    field(DBEBooPrintName; DBEBooPrintName)
                    {
                        ApplicationArea = all;
                        Caption = 'Print Name';
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
            DBEBooPrintName := true;
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
        SalesSetup.GET;
        CompanyInfo.GET;
        CompanyInfo.VerifyAndSetPaymentInfo;
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);
    end;

    trigger OnPostReport()
    begin
        IF LogInteraction AND NOT IsReportInPreviewMode THEN
            IF "Sales Invoice Header".FINDSET THEN
                REPEAT
                    IF "Sales Invoice Header"."Bill-to Contact No." <> '' THEN
                        SegManagement.LogDocument(
                          SegManagement.SalesInvoiceInterDocType, "Sales Invoice Header"."No.", 0, 0, DATABASE::Contact,
                          "Sales Invoice Header"."Bill-to Contact No.", "Sales Invoice Header"."Salesperson Code",
                          "Sales Invoice Header"."Campaign No.", "Sales Invoice Header"."Posting Description", '')
                    ELSE
                        SegManagement.LogDocument(
                          SegManagement.SalesInvoiceInterDocType, "Sales Invoice Header"."No.", 0, 0, DATABASE::Customer,
                          "Sales Invoice Header"."Bill-to Customer No.", "Sales Invoice Header"."Salesperson Code",
                          "Sales Invoice Header"."Campaign No.", "Sales Invoice Header"."Posting Description", '');
                UNTIL "Sales Invoice Header".NEXT = 0;
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text004: Label 'Invoice No.';
        Text005: Label 'Page %1';
        PageCaptionCap: Label 'Page %1 of %2';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
        Cust: Record "Customer";
        VATAmountLine: Record "VAT Amount Line" temporary;
        TempVATAmountLineLCY: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Codeunit "Language";
        CurrExchRate: Record "Currency Exchange Rate";
        TempPostedAsmLine: Record "Posted Assembly Line" temporary;
        VATClause: Record "VAT Clause";
        CustPostGrp: Record "Customer Posting Group";
        TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary;
        recSalesInvoiceLineTMP: Record "Sales Invoice Line" temporary;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit "SegManagement";
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        OrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        NoRef_Caption: Label 'Reference';
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        VALExchRate: Text[50];
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
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
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        recTransportMethod: record "Transport Method";
        TotalAmountVAT: Decimal;
        TotalInvoiceDiscountAmt: Decimal;
        TotalPaymentDiscountOnVAT: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        PhoneNoCaptionLbl: Label 'Phone No.';
        HomePageCaptionLbl: Label 'Home Page';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankCaptionLbl: Label 'Bank';
        AccountNoCaptionLbl: Label 'Account No.';
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        OrderNoCaptionLbl: Label 'Order No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccountNoCaptionLbl: Label 'Account No.';
        DueDateCaptionLbl: Label 'Due Date';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        DimensionsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscountCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        VATClausesCap: Label 'VAT Clause';
        PostedShipmentDateCaptionLbl: Label 'Posted Shipment Date';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscVATCaptionLbl: Label 'Payment Discount on VAT';
        ShipmentCaptionLbl: Label 'Shipment';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATAmntSpecificCaptionLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmountCaptionLbl: Label 'Line Amount';
        EMailCaptionLbl: Label 'E-Mail';
        InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        VATCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        TotalCaptionLbl: Label 'Total';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        DocumentDateCaptionLbl: Label 'Date';
        Text11500: Label 'Invoice';
        recCurrency: record currency;
        Text11501: Label 'Prepayment Invoice';
        HeaderLabel: array[20] of Text[30];
        HeaderTxt: array[20] of Text[120];
        FooterLabel: array[20] of Text[30];
        FooterTxt: array[20] of Text[120];
        ML_OrderNo: Label 'Order No.';
        ML_SalesPerson: Label 'Salesperson';
        ML_Reference: Label 'Reference';
        ML_PmtTerms: Label 'Payment Terms';
        ML_ApplyToDoc: Label 'Refers to Document';
        ML_ShipCond: Label 'Shipping Conditions';
        ML_ShipAdr: Label 'Shipping Address';
        ML_InvAdr: Label 'Invoice Address';
        ML_OrderAdr: Label 'Order Address';
        ML_ShipDate: Label 'Shipping Date';
        ML_Bank: Label 'Bank Information';
        Sales_Nu_Type: Integer;
        Sales_Nu_Type_Title: Integer;
        ML_AccNo: Label 'Account';
        CurrGroupPageNO: Integer;
        InnerGroupPageNO: Integer;
        CurrPageHeaderHiddenFlg: Integer;
        CurrPageFooterHiddenFlg: Integer;
        ML_CustomerNo: Label 'Customer No.';
        NewPageGroupNo: Integer;
        NewPageLine: Boolean;
        recUser: record "User";
        recSalesLineItemServiceTMP: record "Sales invoice Line" temporary;
        AsmInfoExistsForLine: Boolean;
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        DisplayAdditionalFeeNote: Boolean;
        LineNoWithTotal: Integer;
        VATBaseRemainderAfterRoundingLCY: Decimal;
        AmtInclVATRemainderAfterRoundingLCY: Decimal;
        ShiptoAddrCaptionLbl: Label 'Ship-to Address';
        AllowInvDiscCaptionLbl: Label 'Allow Invoice Discount';
        Pos_Caption: Label 'Pos';
        Qty_Caption: Label 'Qty';
        ShipDate_Caption: Label 'Delivery';
        TransportMode_Caption: Label 'Mode of Delivery';
        SalesInvoiceHeaderSellCustNoLbl: Label 'Customer No.';
        ExternalDocNoLbl: Label 'External Document No.';
        CarryoverLbl: Label 'Carryover';
        SaleLineDescLbl: Label 'Description';
        intFormatCurrencyVal: Integer;
        YourReferenceLbl: Label 'Your Reference';
        OurReferenceLbl: Label 'Our Reference';
        txtSerialInfosLbl: Label 'Serial';
        Pos_Value: Integer;
        Pos_Valuetxt: Text;
        ShipDate_ValueTxt: Text;
        Qty_TxtVal: Text;
        TotQty_Val: Decimal;
        TotQty_TxtVal: text;
        xintAttacheLineNo: Integer;
        txtDesc2: text;
        PaymentDiscountVATCaptionLbl: Label 'Payment Discount on VAT';
        TotalVATLbl: label 'Total';
        lineNoNotVisible: Integer;
        AmountCaptionTxt: Text;
        bGenericCustNamePrint: boolean;
        TotalExclVATTxtlbl: Label 'Total %1 Excl. VAT';
        DBEBooPrintName: Boolean;

        lblBankName: Label 'Bank Name';
        lblAccountNo: Label 'Account No.';
        lblSwiftCode: Label 'SWIFT';
        lblIBAN: Label 'IBAN';
        intCountComment: Integer;
        cduFormatMgt: Codeunit DBEFormatMgt;

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure InitializeShipmentBuffer()
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        TempSalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        IF recSalesInvoiceLineTMP."Shipment No." <> '' THEN
            IF SalesShipmentHeader.GET(recSalesInvoiceLineTMP."Shipment No.") THEN
                EXIT;

        IF "Sales Invoice Header"."Order No." = '' THEN
            EXIT;

        CASE recSalesInvoiceLineTMP.Type OF
            recSalesInvoiceLineTMP.Type::Item:
                GenerateBufferFromValueEntry(recSalesInvoiceLineTMP);
            recSalesInvoiceLineTMP.Type::"G/L Account", recSalesInvoiceLineTMP.Type::Resource,
          recSalesInvoiceLineTMP.Type::"Charge (Item)", recSalesInvoiceLineTMP.Type::"Fixed Asset":
                GenerateBufferFromShipment(recSalesInvoiceLineTMP);
        END;

        SalesShipmentBuffer.RESET;
        SalesShipmentBuffer.SETRANGE("Document No.", recSalesInvoiceLineTMP."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", recSalesInvoiceLineTMP."Line No.");
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            TempSalesShipmentBuffer := SalesShipmentBuffer;
            IF SalesShipmentBuffer.NEXT = 0 THEN BEGIN
                SalesShipmentBuffer.GET(
                  TempSalesShipmentBuffer."Document No.", TempSalesShipmentBuffer."Line No.", TempSalesShipmentBuffer."Entry No.");
                SalesShipmentBuffer.DELETE;
                EXIT;
            END;
            SalesShipmentBuffer.CALCSUMS(Quantity);
            IF SalesShipmentBuffer.Quantity <> recSalesInvoiceLineTMP.Quantity THEN BEGIN
                SalesShipmentBuffer.DELETEALL;
                EXIT;
            END;
        END;
    end;

    local procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record "Sales Invoice Line")
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SETRANGE("Posting Date", "Sales Invoice Header"."Posting Date");
        ValueEntry.SETRANGE("Item Charge No.", '');
        ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
        IF ValueEntry.FIND('-') THEN
            REPEAT
                IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                    IF SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    ELSE
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                END;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            UNTIL (ValueEntry.NEXT = 0) OR (TotalQuantity = 0);
    end;

    local procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "Sales Invoice Line")
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine2: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SETCURRENTKEY("Order No.");
        SalesInvoiceHeader.SETFILTER("No.", '..%1', "Sales Invoice Header"."No.");
        SalesInvoiceHeader.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        IF SalesInvoiceHeader.FIND('-') THEN
            REPEAT
                SalesInvoiceLine2.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SETRANGE(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SETRANGE("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                IF SalesInvoiceLine2.FIND('-') THEN
                    REPEAT
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    UNTIL SalesInvoiceLine2.NEXT = 0;
            UNTIL SalesInvoiceHeader.NEXT = 0;

        SalesShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
        SalesShipmentLine.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        SalesShipmentLine.SETRANGE("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SETRANGE("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SETFILTER(Quantity, '<>%1', 0);

        IF SalesShipmentLine.FIND('-') THEN
            REPEAT
                IF "Sales Invoice Header"."Get Shipment Used" THEN
                    CorrectShipment(SalesShipmentLine);
                IF ABS(SalesShipmentLine.Quantity) <= ABS(TotalQuantity - SalesInvoiceLine.Quantity) THEN
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                ELSE BEGIN
                    IF ABS(SalesShipmentLine.Quantity) > ABS(TotalQuantity) THEN
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    IF SalesShipmentHeader.GET(SalesShipmentLine."Document No.") THEN
                        AddBufferEntry(
                          SalesInvoiceLine,
                          Quantity,
                          SalesShipmentHeader."Posting Date");
                END;
            UNTIL (SalesShipmentLine.NEXT = 0) OR (TotalQuantity = 0);
    end;

    local procedure CorrectShipment(var SalesShipmentLine: Record "Sales Shipment Line")
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SETCURRENTKEY("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SETRANGE("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SETRANGE("Shipment Line No.", SalesShipmentLine."Line No.");
        IF SalesInvoiceLine.FIND('-') THEN
            REPEAT
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            UNTIL SalesInvoiceLine.NEXT = 0;
    end;

    local procedure AddBufferEntry(SalesInvoiceLine: Record "Sales Invoice Line"; QtyOnShipment: Decimal; PostingDate: Date)
    begin
        SalesShipmentBuffer.SETRANGE("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SETRANGE("Posting Date", PostingDate);
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.MODIFY;
            EXIT;
        END;

        WITH SalesShipmentBuffer DO BEGIN
            "Document No." := SalesInvoiceLine."Document No.";
            "Line No." := SalesInvoiceLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesInvoiceLine.Type;
            "No." := SalesInvoiceLine."No.";
            Quantity := QtyOnShipment;
            "Posting Date" := PostingDate;
            INSERT;
            NextEntryNo := NextEntryNo + 1
        END;
    end;

    local procedure DocumentCaption(): Text[250]
    var
        DocCaption: Text;
    begin
        IF DocCaption <> '' THEN
            EXIT(DocCaption);
        IF "Sales Invoice Header"."Prepayment Invoice" THEN
            EXIT(Text11501);
        EXIT(Text11500);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure FormatDocumentFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        WITH SalesInvoiceHeader DO BEGIN
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            if "Currency Code" = '' then begin
                AmountCaptionTxt := ' ' + GLSetup."LCY Code";//AmountTxtCst// + ' ' + GLSetup."LCY Code"//AmountCaptionLbl + ' ' + GLSetup."LCY Code"
                TotalExclVATText := StrSubstNo(TotalExclVATTxtlbl, GLSetup."LCY Code");
            end
            else begin
                AmountCaptionTxt := ' ' + "Currency Code";
                TotalExclVATText := StrSubstNo(TotalExclVATTxtlbl, "Currency Code");
            end;

            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            OrderNoText := FormatDocument.SetText("Order No." <> '', FIELDCAPTION("Order No."));
            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FIELDCAPTION("Your Reference"));
            VATNoText := FormatDocument.SetText(CompanyInfo."VAT Registration No." <> '', FIELDCAPTION("VAT Registration No."));
            //VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FIELDCAPTION("VAT Registration No."));
        END;
    end;

    local procedure FormatAddressFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        FormatAddr.GetCompanyAddr(SalesInvoiceHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesInvBillTo(CustAddr, SalesInvoiceHeader);
        ShowShippingAddr := FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, SalesInvoiceHeader);
    end;

    local procedure CollectAsmInformation()
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        TempPostedAsmLine.DELETEALL;
        IF recSalesInvoiceLineTMP.Type <> recSalesInvoiceLineTMP.Type::Item THEN
            EXIT;
        WITH ValueEntry DO BEGIN
            SETCURRENTKEY("Document No.");
            SETRANGE("Document No.", recSalesInvoiceLineTMP."Document No.");
            SETRANGE("Document Type", "Document Type"::"Sales Invoice");
            SETRANGE("Document Line No.", recSalesInvoiceLineTMP."Line No.");
            SETRANGE(Adjustment, FALSE);
            IF NOT FINDSET THEN
                EXIT;
        END;
        REPEAT
            IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN
                IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" THEN BEGIN
                    SalesShipmentLine.GET(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.");
                    IF SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader) THEN BEGIN
                        PostedAsmLine.SETRANGE("Document No.", PostedAsmHeader."No.");
                        IF PostedAsmLine.FINDSET THEN
                            REPEAT
                                TreatAsmLineBuffer(PostedAsmLine);
                            UNTIL PostedAsmLine.NEXT = 0;
                    END;
                END;
        UNTIL ValueEntry.NEXT = 0;
    end;

    local procedure TreatAsmLineBuffer(PostedAsmLine: Record "Posted Assembly Line")
    begin
        CLEAR(TempPostedAsmLine);
        TempPostedAsmLine.SETRANGE(Type, PostedAsmLine.Type);
        TempPostedAsmLine.SETRANGE("No.", PostedAsmLine."No.");
        TempPostedAsmLine.SETRANGE("Variant Code", PostedAsmLine."Variant Code");
        TempPostedAsmLine.SETRANGE(Description, PostedAsmLine.Description);
        TempPostedAsmLine.SETRANGE("Unit of Measure Code", PostedAsmLine."Unit of Measure Code");
        IF TempPostedAsmLine.FINDFIRST THEN BEGIN
            TempPostedAsmLine.Quantity += PostedAsmLine.Quantity;
            TempPostedAsmLine.MODIFY;
        END ELSE BEGIN
            CLEAR(TempPostedAsmLine);
            TempPostedAsmLine := PostedAsmLine;
            TempPostedAsmLine.INSERT;
        END;
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[10]
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

        WITH "Sales Invoice Header" DO BEGIN
            FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header");

            IF "Order No." <> '' THEN BEGIN
                HeaderLabel[1] := ML_OrderNo;
                HeaderTxt[1] := "Order No.";
            END;

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

            CustPostGrp.GET("Customer Posting Group");
        END;
    end;

    procedure PrepareFooter()
    begin
        CLEAR(FooterLabel);
        CLEAR(FooterTxt);

        WITH "Sales invoice Header" DO BEGIN
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

    local procedure GetLineFeeNoteOnReportHist(SalesInvoiceHeaderNo: Code[20])
    var
        LineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist.";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record "Customer";
    begin
        TempLineFeeNoteOnReportHist.DELETEALL;
        CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SETRANGE("Document No.", SalesInvoiceHeaderNo);
        IF NOT CustLedgerEntry.FINDFIRST THEN
            EXIT;

        IF NOT Customer.GET(CustLedgerEntry."Customer No.") THEN
            EXIT;

        LineFeeNoteOnReportHist.SETRANGE("Cust. Ledger Entry No", CustLedgerEntry."Entry No.");
        LineFeeNoteOnReportHist.SETRANGE("Language Code", Customer."Language Code");
        IF LineFeeNoteOnReportHist.FINDSET THEN BEGIN
            REPEAT
                InsertTempLineFeeNoteOnReportHist(LineFeeNoteOnReportHist, TempLineFeeNoteOnReportHist);
            UNTIL LineFeeNoteOnReportHist.NEXT = 0;
        END ELSE BEGIN
            LineFeeNoteOnReportHist.SETRANGE("Language Code", Language.GetUserLanguageCode());
            IF LineFeeNoteOnReportHist.FINDSET THEN
                REPEAT
                    InsertTempLineFeeNoteOnReportHist(LineFeeNoteOnReportHist, TempLineFeeNoteOnReportHist);
                UNTIL LineFeeNoteOnReportHist.NEXT = 0;
        END;
    end;

    local procedure CalcVATAmountLineLCY(SalesInvoiceHeader: Record "Sales Invoice Header"; TempVATAmountLine2: Record "VAT Amount Line" temporary; var TempVATAmountLineLCY2: Record "VAT Amount Line" temporary; var VATBaseRemainderAfterRoundingLCY2: Decimal; var AmtInclVATRemainderAfterRoundingLCY2: Decimal)
    var
        VATBaseLCY: Decimal;
        AmtInclVATLCY: Decimal;
    begin
        IF (NOT GLSetup."Print VAT specification in LCY") OR
           (SalesInvoiceHeader."Currency Code" = '')
        THEN
            EXIT;

        TempVATAmountLineLCY2.INIT;
        TempVATAmountLineLCY2 := TempVATAmountLine2;
        WITH SalesInvoiceHeader DO BEGIN
            VATBaseLCY :=
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Posting Date", "Currency Code", TempVATAmountLine2."VAT Base", "Currency Factor") +
              VATBaseRemainderAfterRoundingLCY2;
            AmtInclVATLCY :=
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Posting Date", "Currency Code", TempVATAmountLine2."Amount Including VAT", "Currency Factor") +
              AmtInclVATRemainderAfterRoundingLCY2;
        END;
        TempVATAmountLineLCY2."VAT Base" := ROUND(VATBaseLCY);
        TempVATAmountLineLCY2."Amount Including VAT" := ROUND(AmtInclVATLCY);
        TempVATAmountLineLCY2.InsertLine;

        VATBaseRemainderAfterRoundingLCY2 := VATBaseLCY - TempVATAmountLineLCY2."VAT Base";
        AmtInclVATRemainderAfterRoundingLCY2 := AmtInclVATLCY - TempVATAmountLineLCY2."Amount Including VAT";
    end;

    local procedure InsertTempLineFeeNoteOnReportHist(var LineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist."; var TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary)
    begin
        REPEAT
            TempLineFeeNoteOnReportHist.INIT;
            TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
            TempLineFeeNoteOnReportHist.INSERT;
        UNTIL TempLineFeeNoteOnReportHist.NEXT = 0;
    end;


    procedure RetrieveEntriesFromPostedInv(var TempItemLedgEntry: record "Item Ledger Entry" temporary; InvoiceRowID: Text[250])
    var
        ValueEntryRelation: Record "Value Entry Relation";
        ValueEntry: Record "Value Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        SignFactor: Integer;
    begin
        // retrieves a data set of Item Ledger Entries (Posted Invoices)
        ValueEntryRelation.SETCURRENTKEY("Source RowId");
        ValueEntryRelation.SETRANGE("Source RowId", InvoiceRowID);
        IF ValueEntryRelation.FIND('-') THEN BEGIN
            REPEAT
                ValueEntry.GET(ValueEntryRelation."Value Entry No.");
                ItemLedgEntry.GET(ValueEntry."Item Ledger Entry No.");
                TempItemLedgEntry := ItemLedgEntry;
                TempItemLedgEntry.Insert(false);
            UNTIL ValueEntryRelation.NEXT = 0;
        END;
    end;
}