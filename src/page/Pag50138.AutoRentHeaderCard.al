page 50138 "Auto Rent Header Card"
{
    Caption = 'Auto Rent Header Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "AutoRentHeaderTable";

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

                field(Status; Rec.Status)
                {
                    ToolTip = 'Status';

                }

            }

            part(Lines; "Auto Rent Line")
            {
                SubPageLink = "Document No." = field("Nr.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(StatusIssued)
            {
                Caption = 'Status Issued';
                ToolTip = 'Change status "Issued"';
                Image = ChangeStatus;

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Change Rent Header Status", Rec);
                end;
            }

            action(StatusOpen)
            {
                Caption = 'Status Open';
                ToolTip = 'Change status "Open"';
                Image = ResetStatus;

                trigger OnAction()
                var
                    ChangeRentHeaderStatus: Codeunit "Change Rent Header Status";
                begin
                    ChangeRentHeaderStatus.RentHeaderStatusOpen(Rec);
                end;
            }

            action(IssuedCarContracts)
            {
                Caption = 'Issued Car Contracts';
                ToolTip = 'Show all issued contracts';
                Image = ShowList;

                RunObject = page "Issued Car Contracts";
                RunPageMode = View;
            }

            action(ImportMedia)
            {
                ApplicationArea = All;
                Caption = 'Import Media';
                Image = Import;

                trigger OnAction()
                var
                    FromFileName: Text;
                    InStreamPic: Instream;
                begin
                    if UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FromFileName, InStreamPic) then begin

                        rec."Driver License".ImportStream(InStreamPic, FromFileName);
                        Rec.Modify(true);
                    end;
                end;
            }

            action(DeleteMedia)
            {
                ApplicationArea = All;
                Caption = 'Delete Driver License';
                Image = Delete;

                trigger OnAction()
                var
                    Err: label 'No driver license found.';
                begin
                    if not rec."Driver License".HasValue then
                        Error(Err);

                    Clear(rec."Driver License");
                    rec.Modify(true);

                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Editable := Rec.Status = Rec.status::Open;
    end;



}