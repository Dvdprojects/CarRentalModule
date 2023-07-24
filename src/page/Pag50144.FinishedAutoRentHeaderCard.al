page 50144 "Finished Auto Rent Header Card"
{
    Caption = 'Finished Auto Rent Header Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    // Editable = false;
    SourceTable = "FinishedAutoRentHeader";

    layout
    {
        area(Content)
        {
            group(General)
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
                    ToolTip = 'Driver License Photo';

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

            part(Lines; "Finished Auto Rent Line")
            {
                SubPageLink = "Document No." = field("Nr.");
            }
        }
    }
}