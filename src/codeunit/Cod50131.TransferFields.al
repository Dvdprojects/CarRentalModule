
codeunit 50131 "TransferFields"
{
    procedure TransferfieldsToHeader(var Rec: Record AutoRentHeaderTable)
    var
        FinishedAutoRentHeader: Record FinishedAutoRentHeader;
    begin
        FinishedAutoRentHeader.Init();
        FinishedAutoRentHeader."Nr." := Rec."Nr.";
        FinishedAutoRentHeader."Client Nr." := Rec."Client Nr.";
        FinishedAutoRentHeader."Driver License" := Rec."Driver License";
        FinishedAutoRentHeader."Date" := Rec."Date";
        FinishedAutoRentHeader."Car Nr." := Rec."Car Nr.";
        FinishedAutoRentHeader."Reserved From" := Rec."Reserved From";
        FinishedAutoRentHeader."Reserved Until" := Rec."Reserved Until";
        FinishedAutoRentHeader."Amount To Pay" := Rec."Amount To Pay";
        FinishedAutoRentHeader.Insert(true);
    end;

    procedure TransferfieldsToLine()
    var
        FinishedAutoRentLine: Record "Finished Auto Rent Line";
        Rec: Record "Auto Rent Line";
    begin
        rec.SetRange("Document No.", rec."Document No.");
        if Rec.FindSet() then
            repeat
                FinishedAutoRentLine.Init();
                FinishedAutoRentLine."Document No." := Rec."Document No.";
                FinishedAutoRentLine."Row No." := Rec."Row No.";
                FinishedAutoRentLine.Type := Rec.Type;
                FinishedAutoRentLine."Nr." := Rec."Nr.";
                FinishedAutoRentLine.Description := Rec.Description;
                FinishedAutoRentLine.Quantity := Rec.Quantity;
                FinishedAutoRentLine.Price := Rec.Price;
                FinishedAutoRentLine.Total := Rec.Total;
                FinishedAutoRentLine.Insert(true);
            until Rec.Next() = 0;
    end;

}
