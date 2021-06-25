report 50709 "Inventory Purchase Orders new"
{
    // version NAVW113.01

    DefaultLayout = RDLC;
    RDLCLayout = './Inventory Purchase Orders.rdl';
    Caption = 'Inventory Purchase Orders';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Description", "Assembly BOM", "Inventory Posting Group", "Statistics Group", "Bin Filter";
            column(CompanyName; COMPANYPROPERTY.DISPLAYNAME)
            {
            }
            column(ItemTableCaptItemFilter; TABLECAPTION + ': ' + ItemFilter)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(PurchOrdLnPurchLnFilter; STRSUBSTNO(Text000, PurchLineFilter))
            {
            }
            column(PurchLineFilter; PurchLineFilter)
            {
            }
            column(ItemNo; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(OutstandingAmt_PurchLine; "Purchase Line"."Outstanding Amount")
            {
            }
            column(VariantFilter_Item; "Variant Filter")
            {
            }
            column(LocationFilter_Item; "Location Filter")
            {
            }
            column(GlobalDim1Filter_Item; "Global Dimension 1 Filter")
            {
            }
            column(GlobalDim2Filter_Item; "Global Dimension 2 Filter")
            {
            }
            column(ItemBinFilter; "Bin Filter")
            {
            }
            column(InventoryPurchaseOrdersCaption; InventoryPurchaseOrdersCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(PurchHeaderPaytoNameCaption; PurchHeaderPaytoNameCaptionLbl)
            {
            }
            column(PurchaseLineExpectedReceiptDateCaption; PurchaseLineExpectedReceiptDateCaptionLbl)
            {
            }
            column(BackOrderQtyCaption; BackOrderQtyCaptionLbl)
            {
            }
            column(PurchaseLineLineDiscountCaption; PurchaseLineLineDiscountCaptionLbl)
            {
            }
            column(PurchaseLineInvDiscountAmountCaption; PurchaseLineInvDiscountAmountCaptionLbl)
            {
            }
            column(PurchaseLineOutstandingAmountCaption; PurchaseLineOutstandingAmountCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "No." = FIELD("No."),
                               "Variant Code" = FIELD("Variant Filter"),
                               "Location Code" = FIELD("Location Filter"),
                               "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                               "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                               "Bin Code" = FIELD("Bin Filter");
                DataItemTableView = SORTING("Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Expected Receipt Date")
                                    WHERE(Type = CONST(Item),
                                          "Document Type" = CONST(Order),
                                          "Outstanding Quantity" = FILTER(<> 0));
                RequestFilterFields = "Expected Receipt Date";
                RequestFilterHeading = 'Purchase Order Line';
                column(DocumentNo_PurchaseLine; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(PattoName_PurchaseLine; PurchHeader."Pay-to Name")
                {
                }
                column(ExpReceiptDt_PurchaseLine; FORMAT("Expected Receipt Date"))
                {
                }
                column(Quantity_PurchaseLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(OutStandingQty_PurchLine; "Outstanding Quantity")
                {
                    IncludeCaption = true;
                }
                column(BackOrderQty; BackOrderQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(DirectUnitCost_PurchLine; "Direct Unit Cost")
                {
                    IncludeCaption = true;
                }
                column(LineDiscount_PurchaseLine; "Line Discount %")
                {
                }
                column(InvDiscountAmt_PurchLine; "Inv. Discount Amount")
                {
                }
                column(OutstandingAmt1_PurchLine; "Outstanding Amount")
                {
                }
                column(Description1_Item; ItemDescription)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PurchHeader.GET("Document Type", "Document No.");
                    IF PurchHeader."Currency Factor" <> 0 THEN
                        "Outstanding Amount" :=
                          ROUND(
                            CurrExchRate.ExchangeAmtFCYToLCY(
                              WORKDATE, PurchHeader."Currency Code",
                              "Outstanding Amount", PurchHeader."Currency Factor"));
                    IF "Expected Receipt Date" < WORKDATE THEN
                        BackOrderQty := "Outstanding Quantity"
                    ELSE
                        BackOrderQty := 0;
                end;

                trigger OnPreDataItem()
                begin
                    //CurrReport.CREATETOTALS("Outstanding Amount", BackOrderQty, "Outstanding Quantity");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ItemDescription := Description;
            end;

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS("Purchase Line"."Outstanding Amount");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemFilter := Item.GETFILTERS;
        PurchLineFilter := "Purchase Line".GETFILTERS;
    end;

    var
        Text000: Label 'Purchase Order Line: %1';
        CurrExchRate: Record "Currency Exchange Rate";
        PurchHeader: Record "Purchase Header";
        ItemFilter: Text;
        PurchLineFilter: Text;
        BackOrderQty: Decimal;
        ItemDescription: Text[50];
        InventoryPurchaseOrdersCaptionLbl: Label 'Inventory Purchase Orders';
        CurrReportPageNoCaptionLbl: Label 'Page';
        PurchHeaderPaytoNameCaptionLbl: Label 'Vendor';
        PurchaseLineExpectedReceiptDateCaptionLbl: Label 'Expected Receipt Date';
        BackOrderQtyCaptionLbl: Label 'Quantity on Back Order';
        PurchaseLineLineDiscountCaptionLbl: Label 'Line Disc. %';
        PurchaseLineInvDiscountAmountCaptionLbl: Label 'Inv. Discount Amount';
        PurchaseLineOutstandingAmountCaptionLbl: Label 'Amount on Order Incl. VAT';
        TotalCaptionLbl: Label 'Total';
}

