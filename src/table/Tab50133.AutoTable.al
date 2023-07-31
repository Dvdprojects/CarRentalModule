table 50133 "AutoTable"
{
    Caption = 'Auto Information';
    DataClassification = CustomerContent;
    // DrillDownPageId = "Resource Card";

    fields
    {
        field(1; "Nr."; Code[20])
        {
            Caption = 'No.';
        }

        field(10; "Auto Name"; Text[30])
        {
            Caption = 'Auto Name';
        }

        field(11; "Brand"; Code[30])
        {
            Caption = 'Auto Brand';
            TableRelation = AutoMarkTable;
        }

        field(12; "Model"; Code[30])
        {
            Caption = 'Auto Model';
            TableRelation = AutoModelTable."Model Code" where("Mark Code" = field(Brand));
        }

        field(13; "Manufacture Date"; Integer)
        {
            Caption = 'Year of manufacture';
        }

        field(14; "Insurance"; Date)
        {
            Caption = 'Insurance valid until';
        }

        field(15; "Technical Inspection"; Date)
        {
            Caption = 'Technical inspection valid until';
        }

        field(16; "Location Code"; Code[10])
        {
            Caption = 'Location code';
            TableRelation = Location.Code;
        }

        field(17; "Rental Service"; Code[20])
        {
            Caption = 'Rental service';
            TableRelation = Resource."No." where(Type = const(Machine));
            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                If Resource.Get("Rental Service") then
                    "Rental Price" := Resource."Unit Price";
            end;
        }

        field(18; "Rental Price"; Decimal)
        {
            Caption = 'Rental price';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Nr.") { Clustered = true; }
    }

    trigger OnInsert()
    begin
        SetAutoCarNumber();
    end;


    Local procedure SetAutoCarNumber();
    var
        AutoSetup: Record "AutoSetupTable";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "Nr." = '' then begin
            AutoSetup.Get();
            AutoSetup.TestField("License Plates Series");
            "Nr." := NoSeriesManagement.GetNextNo(AutoSetup."License Plates Series", WorkDate(), true);
        end;
    end;

}