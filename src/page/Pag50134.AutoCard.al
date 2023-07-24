page 50134 "Auto Card"
{
    Caption = 'Car Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "AutoTable";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Nr."; Rec."Nr.")
                {
                    ToolTip = 'No.';

                }

                field("Auto Name"; Rec."Auto Name")
                {
                    ToolTip = 'Auto Name';
                }

                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Auto Brand';
                }

                field(Model; Rec.Model)
                {
                    ToolTip = 'Auto Model';
                }

                field("Manufacture Date"; Rec."Manufacture Date")
                {
                    ToolTip = 'Year of manufacture';
                }

                field(Insurance; Rec.Insurance)
                {
                    ToolTip = 'Civil insurance is valid until';

                }

                field("Technical Inspection"; Rec."Technical Inspection")
                {
                    ToolTip = 'The technical inspection is valid until';

                }

                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Location code';

                }

                field("Rental Service"; Rec."Rental Service")
                {
                    ToolTip = 'Rental service';

                }

                field("Rental Price"; Rec."Rental Price")
                {
                    ToolTip = 'Rental price';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenAutoSetup)
            {
                Caption = 'Open Auto Setup';
                Image = Setup;

                RunObject = page "Auto Setup Card";
            }

            action(AddCarMark)
            {
                Caption = 'Add Car Mark';
                Image = Add;

                RunObject = page "Auto Mark List";
                RunPageMode = View;
            }

            action(AddCarModel)
            {
                Caption = 'Add Car Models';
                Image = AddAction;

                RunObject = page "Auto Model List";
            }

            action(ReservationList)
            {
                Caption = 'Open Car Reservation List';
                Image = Open;

                RunObject = page "Auto Reservation List";
                RunPageLink = "Car Nr." = field("Nr.");
                RunPageMode = View;
            }

        }
    }

}