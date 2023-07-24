page 50143 "Auto Rent Damage"
{
    Caption = 'Auto Rent Damage List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Damage";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document Nr."; Rec."Document Nr.")
                {
                    ToolTip = 'Document Nr.';
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

            }
        }
    }

}