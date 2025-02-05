unit Model.Item;

interface

type
  TItem = class
    private
      FCodigoPedido: Integer;
      FTotalItem: Extended;
      FCodigoProduto: Integer;
      FValorUnitario: Extended;
      FQuantidade: Integer;
      class var FInstance: TItem;
      procedure SetCodigoProduto(const Value: Integer);
      procedure SetQuantidade(const Value: Integer);
      procedure SetTotalItem(const Value: Extended);
      procedure SetValorUnitario(const Value: Extended);
    procedure SetCodigoPedido(const Value: Integer);
    public
      property CodigoPedido: Integer read FCodigoPedido write SetCodigoPedido;
      property CodigoProduto: Integer read FCodigoProduto write SetCodigoProduto;
      property Quantidade: Integer read FQuantidade write SetQuantidade;
      property ValorUnitario: Extended read FValorUnitario write SetValorUnitario;
      property TotalItem: Extended read FTotalItem write SetTotalItem;
      class function GetInstance: TItem;
  end;

implementation

{ TItem }

class function TItem.GetInstance: TItem;
begin
  if not Assigned(FInstance) then
    FInstance := TItem.Create;
  Result := FInstance;
end;

procedure TItem.SetCodigoPedido(const Value: Integer);
begin
  FCodigoPedido := Value;
end;

procedure TItem.SetCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

procedure TItem.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TItem.SetTotalItem(const Value: Extended);
begin
  FTotalItem := Value;
end;

procedure TItem.SetValorUnitario(const Value: Extended);
begin
  FValorUnitario := Value;
end;

end.
