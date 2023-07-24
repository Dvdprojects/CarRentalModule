page 50130 "Auto Setup Card"
{
    Caption = 'Auto Setup Card';
    PageType = ListPart;
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTable = "AutoSetupTable";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("License Plates Series"; Rec."License Plates Series")
                {
                    ToolTip = 'License Plates Series';
                }

                field("Rental card series"; Rec."Rental card series")
                {
                    ToolTip = 'Rental card series';
                }

                field(Attachments; Rec.Attachments)
                {
                    ToolTip = 'Attachments';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;
}