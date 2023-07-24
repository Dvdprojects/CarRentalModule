table 50136 "AutoRentHeaderTable"
{
    Caption = 'Auto Rent Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Nr."; Code[20])
        {
            Caption = 'Nr.';
            Editable = false;
        }

        field(10; "Client Nr."; Code[20])
        {
            Caption = 'Client Number';
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                CheckIfClientBlocked();
                CheckStatusIssued();
                CheckClientAvailableAmount();
            end;
        }

        field(11; "Driver License"; Media)
        {
            Caption = 'Driver License';
            DataClassification = OrganizationIdentifiableInformation;

            trigger OnValidate()
            begin
                CheckStatusIssued();
            end;

        }

        field(12; "Date"; Date)
        {
            Caption = 'Date';

            trigger OnValidate()
            begin
                CheckStatusIssued();
            end;
        }

        field(13; "Car Nr."; Code[20])
        {
            Caption = 'Car Number';
            TableRelation = AutoTable."Nr.";

            trigger OnValidate()
            begin
                CheckStatusIssued();
            end;
        }

        field(14; "Reserved From"; Date)
        {
            Caption = 'Reserved From';

            trigger OnValidate()
            begin
                CheckStatusIssued();
                CheckFieldReservedFrom();
            end;

        }

        field(15; "Reserved Until"; Date)
        {
            Caption = 'Reserved Until';

            trigger OnValidate()
            begin
                CheckStatusIssued();
                CheckFieldReservedUntil();
                CheckExistingReservations()
            end;

        }

        field(16; "Amount To Pay"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;

            FieldClass = FlowField;
            CalcFormula = sum("Auto Rent Line".Total where("Document No." = field("Nr.")));
        }

        field(17; "Status"; Enum "Auto Rent Header Status")
        {
            Caption = 'Status';
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Nr.") { Clustered = true; }
    }

    trigger OnInsert()
    begin
        SetAutoRentNumber();
    end;


    trigger OnModify()
    begin
        CheckStatusIssued();
    end;


    trigger OnRename()
    begin
        Error('Rename not allowed');
    end;


    local procedure CheckStatusIssued()
    begin
        if Rec.Status = Rec.Status::Issued then
            Error('Status Issued');
    end;


    local procedure SetAutoRentNumber()
    var
        AutoSetup: Record "AutoSetupTable";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "Nr." = '' then begin
            AutoSetup.Get();
            AutoSetup.TestField("Rental card series");
            "Nr." := NoSeriesManagement.GetNextNo(AutoSetup."Rental card series", WorkDate(), true);
        end;
    end;


    procedure CheckIfClientBlocked();
    var
        Customer: Record Customer;
    begin
        if Customer.Get(Rec."Client Nr.") then begin
            Customer.TestField(Blocked, Customer.Blocked::" ");
        end;
    end;


    procedure CheckClientAvailableAmount();
    var
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustomerLedgerEntry."Customer No." := rec."Client Nr.";
        If CustomerLedgerEntry."Amount (LCY)" > 0 then
            Error('Customer %1 Amount LCY is larger than 0');
    end;


    procedure CheckFieldReservedFrom();
    var
        err: label 'Reservation not found';
        AutoReservation: Record AutoReservationTable;
        FoundReservation: Boolean;
    begin
        FoundReservation := false;

        if Rec."Reserved From" = 0D then
            exit;

        AutoReservation.SetRange("Client Nr.", Rec."Client Nr.");
        AutoReservation.SetRange("Car Nr.", Rec."Car Nr.");

        if AutoReservation.FindSet then begin
            repeat
                if ("Reserved From" = AutoReservation."Reserved From") then begin
                    FoundReservation := true;
                    break;
                end;
            until AutoReservation.Next() = 0;
        end;

        if not FoundReservation then
            Error(err);
    end;



    procedure CheckFieldReservedUntil()
    var
        err: Label 'Reservation not found';
        AutoReservation: Record "AutoReservationTable";
        FoundReservation: Boolean;
    begin
        FoundReservation := false;

        if "Reserved Until" = 0D then
            exit;

        AutoReservation.SetRange("Client Nr.", Rec."Client Nr.");
        AutoReservation.SetRange("Car Nr.", Rec."Car Nr.");

        if AutoReservation.FindSet() then begin
            repeat
                if (Rec."Client Nr." = AutoReservation."Client Nr.") and
                   (Rec."Car Nr." = AutoReservation."Car Nr.") and
                   (Rec."Reserved From" = AutoReservation."Reserved From") and
                   (Rec."Reserved Until" = AutoReservation."Reserved Until") then begin
                    FoundReservation := true;
                    break;
                end;
            until AutoReservation.NEXT = 0;
        end;

        if not FoundReservation then
            Error(err);
    end;



    local procedure CheckExistingReservations()
    var
        Err: Label 'This Car reservation is used.';
        DuplicateReservations: Record AutoRentHeaderTable;
        ReservedFrom: Date;
        ReservedUntil: Date;
    begin
        ReservedFrom := rec."Reserved From";
        ReservedUntil := rec."Reserved Until";

        if ("Reserved From" <> 0D) and ("Reserved Until" <> 0D) then begin
            DuplicateReservations.SetRange("Client Nr.", Rec."Client Nr.");
            DuplicateReservations.SetRange("Car Nr.", rec."Car Nr.");

            if DuplicateReservations.FindSet() then begin
                repeat
                    if (DuplicateReservations."Reserved From" = ReservedFrom) and
                       (DuplicateReservations."Reserved Until" = ReservedUntil) then begin
                        Error(err);
                    end;
                until DuplicateReservations.NEXT = 0;
            end;
        end;
    end;

}