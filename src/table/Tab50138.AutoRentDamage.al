table 50138 "Auto Rent Damage"
{
    Caption = 'Auto Rent Damage';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Nr."; Code[10])
        {
            Caption = 'Car Nr.';
        }

        field(2; "Row Number"; Integer)
        {
            Caption = 'Row number';
            AutoIncrement = true;
        }

        field(10; "Date"; Date)
        {
            Caption = 'Date';
        }

        field(11; "Description"; Text[30])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Document Nr.", "Row Number") { Clustered = true; }
    }

}