table 50135 "AutoDamageTable"
{
    Caption = 'Auto Reservation';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Car Nr."; Code[10])
        {
            Caption = 'Car Nr.';
            TableRelation = AutoReservationTable."Car Nr.";
        }

        field(2; "Row Number"; Integer)
        {
            Caption = 'Row number';
            TableRelation = AutoReservationTable."Row Number";
        }

        field(10; "Date"; DateTime)
        {
            Caption = 'Date';
        }

        field(11; "Description"; Text[30])
        {
            Caption = 'Description';
        }

        field(12; "Status"; Enum "Damage Status")
        {
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Car Nr.", "Row Number") { Clustered = true; }
    }
}