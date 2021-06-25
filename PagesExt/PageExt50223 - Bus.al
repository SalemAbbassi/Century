pageextension 50250 DBEBusinessManagerRCExt extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here

        addafter("Sales Orders")
        {
            action(SalesOrder)
            {
                Visible = true;
                ApplicationArea = all;
                Caption = 'Sales Orders';
                RunObject = page "Sales Order List";
                RunPageView = WHERE("DBESubtype" = CONST(normal));

            }
            action(ConsignmentSalesOrder)
            {
                ApplicationArea = all;
                Caption = 'Consignment Sales Orders';
                RunObject = page DBESalesOrderConsignmentList;

            }
        }
        modify("Sales Orders")
        {
            Visible = false;
        }
    }
}