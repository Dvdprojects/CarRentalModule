table 50132 "AutoModelTable"
{
    Caption = 'Auto Model';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Mark Code"; Code[30])
        {
            Caption = 'Mark code';
            TableRelation = AutoMarkTable."Mark Code";
        }

        field(2; "Model Code"; Code[30])
        {
            Caption = 'Model code';
        }

        field(10; "Description"; Text[30])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Model Code")
        {
            Clustered = true;
        }

        key(Key2; "Mark Code") { }
    }

    trigger OnModify()
    begin
        CheckDuplicates();
    end;


    local procedure CheckDuplicates()
    var
        DuplicateRec: Record "AutoModelTable";
    begin
        DuplicateRec.SetRange("Mark Code", Rec."Mark Code");
        DuplicateRec.SetRange("Model Code", Rec."Model Code");
        DuplicateRec.SetRange("Description", Rec.Description);

        if DuplicateRec.FindSet then begin
            ERROR('Cannot insert duplicate record with the same mark code, model code.');
        end;
    end;
}
