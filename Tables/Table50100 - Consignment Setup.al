table 50100 DBEConsignmentSetup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';

            Editable = false;
        }
        field(10; DBELocationSource; code[20])
        {
            Caption = 'Location Code Source';
            TableRelation = Location;
        }
        field(11; DBELocationTarget; code[20])
        {
            Caption = 'Location Code Target';
            TableRelation = Location;
        }
        field(12; DBELocationTransit; code[20])
        {
            Caption = 'Location Code transit';
            TableRelation = Location where("Use as In-Transit" = const(true));
        }
        field(13; CENTURYAutoConsignment; Boolean)
        {
            Caption = 'Auto Consignment';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}