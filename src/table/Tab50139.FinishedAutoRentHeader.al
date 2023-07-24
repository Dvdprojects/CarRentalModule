table 50139 "FinishedAutoRentHeader"
{
    Caption = 'Finished Auto Rent Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Nr."; Code[20])
        {
            Caption = 'Nr.';
        }

        field(10; "Client Nr."; Code[20])
        {
            Caption = 'Client Number';
        }

        field(11; "Driver License"; Media)
        {
            Caption = 'Driver License';
        }

        field(12; "Date"; Date)
        {
            Caption = 'Date';
        }

        field(13; "Car Nr."; Code[20])
        {
            Caption = 'Car Number';
        }

        field(14; "Reserved From"; Date)
        {
            Caption = 'Reserved From';
        }

        field(15; "Reserved Until"; Date)
        {
            Caption = 'Reserved Until';
        }

        field(16; "Amount To Pay"; Decimal)
        {
            Caption = 'Total Amount';
        }
    }

    keys
    {
        key(Key1; "Nr.") { Clustered = true; }
    }
}