table 50131 "AutoMarkTable"
{
    Caption = 'Auto Mark';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Mark Code"; Code[30])
        {
            Caption = 'Mark code';
        }

        field(10; "Description"; Code[30])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Mark Code")
        {
            Clustered = true;
        }
    }
}