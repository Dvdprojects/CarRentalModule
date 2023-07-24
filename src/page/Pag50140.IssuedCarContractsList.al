page 50140 "Issued Car Contracts"
{
    Caption = 'Issued Car Contracts';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AutoRentHeaderTable";

    InsertAllowed = false;
    ModifyAllowed = false;

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

                field(Status; Rec.Status)
                {
                    ToolTip = 'Status';

                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        IssuedContractsFilter();
    end;

    procedure IssuedContractsFilter()
    begin
        Rec.Reset();
        Rec.SetRange(Status, rec.Status::Issued);
    end;
}