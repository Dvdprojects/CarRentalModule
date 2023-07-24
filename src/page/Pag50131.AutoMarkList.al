page 50131 "Auto Mark List"
{
    Caption = 'Auto Mark List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AutoMarkTable";


    layout
    {
        area(Content)
        {
            repeater(GroupName)

            {
                field("Mark Code"; Rec."Mark Code")
                {
                    ToolTip = 'Mark code';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
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
                Caption = 'Add car models';
                Image = Add;

                RunObject = page "Auto Model List";
                RunPageMode = View;

            }
        }
    }
}