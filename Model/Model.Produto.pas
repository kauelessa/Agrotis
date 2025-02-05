unit Model.Produto;

interface

type
  TProduto = class
  private
    FDescricao: string;
    FCodigoProduto: Integer;
    procedure SetCodigoProduto(const Value: Integer);
    procedure SetDescricao(const Value: string);
    class var FInstance: TProduto;
  public
    property CodigoProduto: Integer read FCodigoProduto write SetCodigoProduto;
    property Descricao: string read FDescricao write SetDescricao;
    class function GetInstance: TProduto;
  end;

implementation

{ TProduto }

class function TProduto.GetInstance: TProduto;
begin
  if not Assigned(FInstance) then
    FInstance := TProduto.Create;
  Result := FInstance;
end;

procedure TProduto.SetCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
