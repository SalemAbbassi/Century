page 50101 BinContentSerialList
{
    Caption = 'Bin Content Serial Info.';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Warehouse Entry";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Bin Code"; "Bin Code")
                {
                    ApplicationArea = All;

                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;

                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;

                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        LoadDatas();
    end;

    procedure LoadDatas()
    var
        qryBinContentSerial: Query BinContentSerialNo;
        i: Integer;
        recItem: Record Item;

    begin
        CLEAR(Rec);
        DELETEALL;
        i := 1;
        //qryBinContentSerial.SETFILTER(Item_No,'%1',p_codItemNo);
        IF qryBinContentSerial.OPEN THEN
            WHILE qryBinContentSerial.READ() DO BEGIN
                if (recItem.get(qryBinContentSerial.Item_No)) and
                    (recItem."Item Tracking Code" <> '') then begin
                    INIT();
                    "Entry No." := i;
                    "Item No." := qryBinContentSerial.Item_No;
                    "Bin Code" := qryBinContentSerial.Bin_Code;
                    Quantity := qryBinContentSerial.Sum_Quantity;
                    "Serial No." := qryBinContentSerial.DBESerialNo;
                    INSERT();
                    i += 1;
                end;
            END;
        IF FINDSET() THEN;

        CurrPage.UPDATE(FALSE);
    end;
}