page 50141 "Auto Rent Line"
{
    Caption = 'Auto Rent Lines';

    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Auto Rent Line";

    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;

    layout
    {
        area(Content)
        {

            repeater(GroupName)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Document number';
                }

                field("Row No."; Rec."Row No.")
                {
                    ToolTip = 'Row number';
                }

                field(Type; Rec.Type)
                {
                    ToolTip = 'Type';

                }

                field("Nr."; Rec."Nr.")
                {
                    ToolTip = 'Service number';
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'Description';
                }

                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Quantity';
                }

                field(Price; Rec.Price)
                {
                    ToolTip = 'Unit price';
                }

                field(Total; Rec.Total)
                {
                    ToolTip = 'Total amount';
                }


            }
        }
    }
}