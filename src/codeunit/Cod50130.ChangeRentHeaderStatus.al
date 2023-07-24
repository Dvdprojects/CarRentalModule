codeunit 50130 "Change Rent Header Status"
{
    TableNo = AutoRentHeaderTable;

    trigger OnRun()
    begin
        OnBeforeIssuedStatus(Rec);

        Rec.Status := Rec.Status::Issued;
        Rec.Modify(false);

        OnAfterIssuedStatus(Rec);
    end;


    procedure RentHeaderStatusOpen(var AutoRentHeader: Record AutoRentHeaderTable)
    begin
        OnBeforeOpenStatus(AutoRentHeader);

        AutoRentHeader.Status := AutoRentHeader.Status::Open;
        AutoRentHeader.Modify(true);

        OnAfterOpenStatus(AutoRentHeader);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIssuedStatus(var AutoRentHeader: Record AutoRentHeaderTable)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterIssuedStatus(var AutoRentHeader: Record AutoRentHeaderTable)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOpenStatus(var AutoRentHeader: Record AutoRentHeaderTable)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOpenStatus(var AutoRentHeader: Record AutoRentHeaderTable)
    begin
    end;
}