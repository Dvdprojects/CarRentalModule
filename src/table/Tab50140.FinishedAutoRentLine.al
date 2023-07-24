table 50140 "Finished Auto Rent Line"
{
    Caption = 'Finished Auto Rent line';
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document Number';
        }

        field(2; "Row No."; Integer)
        {
            Caption = 'Row No.';
        }

        field(10; "Type"; Enum "Auto Rent Line Type")
        {
            Caption = 'Type';
        }

        field(11; "Nr."; Code[20])
        {
            Caption = 'Nr.';
        }

        field(12; "Description"; Text[30])
        {
            Caption = 'Description';
        }

        field(13; "Quantity"; Integer)
        {
            Caption = 'Quantity';
        }

        field(14; "Price"; Decimal)
        {
            Caption = 'Unit Price';
        }

        field(15; "Total"; Decimal)
        {
            Caption = 'Total amount';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Row No.") { Clustered = true; }
    }
}