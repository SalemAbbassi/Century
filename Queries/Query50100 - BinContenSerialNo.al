query 50100 BinContentSerialNo
{

    elements
    {
        dataitem("Warehouse_Entry";"Warehouse Entry")
        {
            column(Bin_Code;"Bin Code")
            {
            }
            column(Item_No;"Item No.")
            {
            }
            column(Sum_Quantity;Quantity)
            {
                Method = Sum;
            }
            column(DBESerialNo;DBESerialNo)
            {
            }
            column(Serial_No;"Serial No.")
            {
            }
        }
    }
}

