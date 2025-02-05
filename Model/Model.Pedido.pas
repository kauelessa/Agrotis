unit Model.Pedido;

interface

type
  TPedido = class
    private
      FDataEmissao: TDateTime;
      FCodigoPedido: Integer;
      FTotalPedido: Extended;
      FCodigoCliente: Integer;
      FNumeroPedido: Integer;
      FReferencia: string;
      FTipoOperacao: string;
      class var FInstance: TPedido;
      procedure SetCodigoCliente(const Value: Integer);
      procedure SetCodigoPedido(const Value: Integer);
      procedure SetDataEmissao(const Value: TDateTime);
      procedure SetNumeroPedido(const Value: Integer);
      procedure SetReferencia(const Value: string);
      procedure SetTipoOperacao(const Value: string);
      procedure SetTotalPedido(const Value: Extended);
    public
      property CodigoPedido: Integer read FCodigoPedido write SetCodigoPedido;
      property Referencia: string read FReferencia write SetReferencia;
      property NumeroPedido: Integer read FNumeroPedido write SetNumeroPedido;
      property DataEmissao: TDateTime read FDataEmissao write SetDataEmissao;
      property CodigoCliente: Integer read FCodigoCliente write SetCodigoCliente;
      property TipoOperacao: string read FTipoOperacao write SetTipoOperacao;
      property TotalPedido: Extended read FTotalPedido write SetTotalPedido;
      class function GetInstance: TPedido;
  end;

implementation

{ TPedido }

class function TPedido.GetInstance: TPedido;
begin
  if not Assigned(FInstance) then
    FInstance := TPedido.Create;
  Result := FInstance;
end;

procedure TPedido.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TPedido.SetCodigoPedido(const Value: Integer);
begin
  FCodigoPedido := Value;
end;

procedure TPedido.SetDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TPedido.SetNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedido.SetReferencia(const Value: string);
begin
  FReferencia := Value;
end;

procedure TPedido.SetTipoOperacao(const Value: string);
begin
  FTipoOperacao := Value;
end;

procedure TPedido.SetTotalPedido(const Value: Extended);
begin
  FTotalPedido := Value;
end;

end.
