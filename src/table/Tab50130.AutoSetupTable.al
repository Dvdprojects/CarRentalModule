table 50130 "AutoSetupTable"
{
    Caption = 'Auto Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(10; "License Plates Series"; Text[20])
        {
            Caption = 'License Plates Series';
            TableRelation = "No. Series";
        }

        field(11; "Rental card series"; Text[20])
        {
            Caption = 'Rental card series';
            TableRelation = "No. Series";
        }

        field(12; "Attachments"; Text[30])
        {
            Caption = 'Attachments';
            TableRelation = Location;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Primary Key") { }
        fieldgroup(Brick; "Primary Key") { }
    }


    // trigger OnInsert()
    // begin
    //     InitDefaultValues();
    // end;

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;

    // local procedure InitDefaultValues()
    // begin

    // end;
}