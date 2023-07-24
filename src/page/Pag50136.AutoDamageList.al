page 50136 "Auto Damage List"
{
    Caption = 'Auto Damage List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AutoDamageTable";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Car Nr."; Rec."Car Nr.")
                {
                    ToolTip = 'Car Nr.';
                }

                field("Row Number"; Rec."Row Number")
                {
                    ToolTip = 'Row number';
                }

                field(Date; Rec.Date)
                {
                    ToolTip = 'Date';
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';

                }

                field(Status; Rec.Status)
                {
                    ToolTip = 'Status';

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                Caption = 'Open Auto Rent Header';
                Image = Open;

                RunObject = page "Auto Rent Header List";
            }
        }
    }
}