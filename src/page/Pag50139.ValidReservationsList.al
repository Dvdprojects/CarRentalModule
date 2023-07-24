page 50139 "Valid Reservations"
{
    Caption = 'Valid Reservations';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "AutoReservationTable";

    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Car Nr."; Rec."Car Nr.")
                {
                    ToolTip = 'Car number';

                }

                field("Row Number"; Rec."Row Number")
                {
                    ToolTip = 'Row number';

                }

                field("Client Nr."; Rec."Client Nr.")
                {
                    ToolTip = 'Client number';

                }

                field("Reserved From"; Rec."Reserved From")
                {
                    ToolTip = 'Reserved from';

                }

                field("Reserved Until"; Rec."Reserved Until")
                {
                    ToolTip = 'Reserved until';

                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        SetAutoReservationFilter();
    end;

    procedure SetAutoReservationFilter()
    begin
        Rec.Reset();
        Rec.SetFilter("Reserved Until", '%1..', Today);
    end;
}