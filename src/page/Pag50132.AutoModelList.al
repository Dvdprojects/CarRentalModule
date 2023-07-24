page 50132 "Auto Model List"
{
    Caption = 'Auto Model List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AutoModelTable";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Mark Code"; Rec."Mark Code")
                {
                    ToolTip = 'Mark code';
                    DrillDown = TRUE;
                }

                field("Model Code"; Rec."Model Code")
                {
                    ToolTip = 'Model code';
                    DrillDown = TRUE;

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
                Caption = 'Register car';
                Image = Register;

                RunObject = page "Auto List";
                RunPageMode = View;
            }
        }
    }
}