table 50134 "AutoReservationTable"
{
    Caption = 'Auto Reservation';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Car Nr."; Code[20])
        {
            Caption = 'Car Number.';
            TableRelation = AutoTable."Nr.";
        }

        field(2; "Row Number"; Integer)
        {
            Caption = 'Row Number';
            AutoIncrement = true;
            Editable = false;
        }

        field(10; "Client Nr."; Code[20])
        {
            Caption = 'Client Number';
            TableRelation = Customer."No.";
        }

        field(11; "Reserved From"; Date)
        {
            Caption = 'Reserved From';

            trigger OnValidate()
            begin
                CheckIfDateValid();
                CheckExistingReservations();
            end;
        }

        field(12; "Reserved Until"; Date)
        {
            Caption = 'Reserved Until';

            trigger OnValidate()
            begin
                CheckIfDateValid();
                CheckExistingReservations();
            end;
        }
    }

    keys
    {
        key(Key1; "Car Nr.", "Row Number") { Clustered = true; }
        key(Key2; "Reserved From", "Reserved Until") { }
    }


    //Veikia bet kai ta pacia diena graziname ir norime paimti - error
    local procedure CheckExistingReservations()
    var
        err: Label 'Car is reserved on this date, select other.';
        ExistingReservations: Record "AutoReservationTable";
        ReservedFrom: Date;
        ReservedUntil: Date;
    begin
        ReservedFrom := rec."Reserved From";
        ReservedUntil := rec."Reserved Until";

        if ("Reserved From" <> 0D) and ("Reserved Until" <> 0D) then begin
            ExistingReservations.SetRange("Car Nr.", rec."Car Nr.");

            if ExistingReservations.FindSet() then begin
                repeat
                    if (ExistingReservations."Reserved From" <= ReservedUntil) and
                       (ExistingReservations."Reserved Until" >= ReservedFrom) then begin
                        Error(err);
                    end;
                until ExistingReservations.NEXT = 0;
            end;
        end;
    end;


    local procedure CheckIfDateValid()
    var
        BadDateErr: Label 'The start date cannot be older than the end date.';
    begin
        if ("Reserved Until" <> 0D) and ("Reserved From" > "Reserved Until") then
            Error(BadDateErr);
    end;

}