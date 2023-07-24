table 50137 "Auto Rent Line"
{
    Caption = 'Auto Rent line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document Number';
        }

        field(2; "Row No."; Integer)
        {
            Caption = 'Row No.';
        }

        field(10; "Type"; Enum "Auto Rent Line Type")
        {
            Caption = 'Type';
        }

        field(11; "Nr."; Code[20])
        {
            Caption = 'Nr.';
            TableRelation =
            if ("Type" = const(Resource)) Resource."No." where(Type = const(Person))
            else
            if ("Type" = const(Item)) Item."No.";

            trigger OnValidate()
            var
                Resource: Record Resource;
                Item: Record Item;
            begin
                if ("Type" = Type::Resource) then begin
                    if Resource.GET("Nr.") then begin
                        Description := Resource.Name;
                        Quantity := 1;
                        Price := Resource."Unit Price";
                        Total := Round(Quantity * Price);
                    end;

                end
                else
                    if ("Type" = Type::Item) then begin
                        if Item.GET("Nr.") then begin
                            Description := Item.Description;
                            Quantity := 1;
                            Price := Item."Unit Price";
                            Total := Round(Quantity * Price);
                        end;
                    end;
            end;
        }

        field(12; "Description"; Text[30])
        {
            Caption = 'Description';
        }

        field(13; "Quantity"; Integer)
        {
            Caption = 'Quantity';

            trigger OnValidate()
            begin
                "Total" := Round(Quantity * Price);
            end;
        }

        field(14; "Price"; Decimal)
        {
            Caption = 'Unit Price';

            trigger OnValidate()
            begin
                "Total" := Round(Quantity * Price);
            end;
        }

        field(15; "Total"; Decimal)
        {
            Caption = 'Total amount';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Row No.") { Clustered = true; }
    }
}

