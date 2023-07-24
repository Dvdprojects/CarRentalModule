page 50142 "Finished Auto Rent Header List"
{
    Caption = 'Finished Auto Rent Header List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "FinishedAutoRentHeader";

    CardPageId = "Finished Auto Rent Header Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    // Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Nr."; Rec."Nr.")
                {
                    ToolTip = 'No.';
                }

                field("Client Nr."; Rec."Client Nr.")
                {
                    ToolTip = 'Client Nr.';
                }

                field("Driver License"; Rec."Driver License")
                {
                    ToolTip = 'Driver License';

                }

                field(Date; Rec.Date)
                {
                    ToolTip = 'Date';

                }

                field("Car Nr."; Rec."Car Nr.")
                {
                    ToolTip = 'Car Nr.';
                }

                field("Reserved From"; Rec."Reserved From")
                {
                    ToolTip = 'Reserved From';

                }

                field("Reserved Until"; Rec."Reserved Until")
                {
                    ToolTip = 'Reserved Until';

                }

                field("Amount To Pay"; Rec."Amount To Pay")
                {
                    ToolTip = 'Total Amount';

                }

            }
        }
    }
}