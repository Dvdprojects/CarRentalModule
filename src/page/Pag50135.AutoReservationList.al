page 50135 "Auto Reservation List"
{
    Caption = 'Auto Reservation List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "AutoReservationTable";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Car Nr."; Rec."Car Nr.")
                {
                    ToolTip = 'Car number';
                    ShowMandatory = true;
                }

                field("Row Number"; Rec."Row Number")
                {
                    ToolTip = 'Row number';
                }

                field("Client Nr."; Rec."Client Nr.")
                {
                    ToolTip = 'Client number';
                    ShowMandatory = true;
                }

                field("Reserved From"; Rec."Reserved From")
                {
                    ToolTip = 'Reserved from';
                    ShowMandatory = true;
                }

                field("Reserved Until"; Rec."Reserved Until")
                {
                    ToolTip = 'Reserved until';
                    ShowMandatory = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateNewCar)
            {
                Caption = 'Create New Car';
                Image = Create;

                trigger OnAction()
                begin
                    Page.Run(Page::"Auto List");
                end;
            }

            action(RegisterDamage)
            {
                Caption = 'Register damage';
                RunObject = page "Auto Damage List";
                Image = Register;

                trigger OnAction()
                begin
                    CurrentCarDamageRegister();
                end;
            }

            action(ValidReservations)
            {
                Caption = 'Open Valid Reservations List';
                Image = Reserve;

                RunObject = page "Valid Reservations";
                RunPageMode = View;
            }

            action(OpenAutoRent)
            {
                Caption = 'Open Auto Rent Header';
                image = Open;

                RunObject = page "Auto Rent Header List";
                RunPageMode = View;
            }
        }
    }

    // Ne iki galo atlikta
    procedure CurrentCarDamageRegister()
    var
        AutoDamage: record AutoDamageTable;
    begin
        AutoDamage.Init();
        AutoDamage."Car Nr." := Rec."Car Nr.";
        AutoDamage."Row Number" := Rec."Row Number";
        AutoDamage.Status := AutoDamage.Status::Relevant;
        AutoDamage.Insert(true);
    end;


}