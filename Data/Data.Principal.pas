unit Data.Principal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Classe.Conexao, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase;

type
  TDMPrincipal = class(TDataModule)
    qryCliente: TFDQuery;
    qryProduto: TFDQuery;
    qryPedido: TFDQuery;
    qryItens: TFDQuery;
    qryClienteCodigoCliente: TFDAutoIncField;
    qryClienteNome: TStringField;
    qryClienteCEP: TStringField;
    qryClienteLogradouro: TStringField;
    qryClienteComplemento: TStringField;
    qryClienteBairro: TStringField;
    qryClienteCidade: TStringField;
    qryClienteUF: TStringField;
    qryClienteCodigoIBGE: TStringField;
    qryProdutoCodigoProduto: TFDAutoIncField;
    qryProdutoDescricao: TStringField;
    qryPedidoCodigo: TFDAutoIncField;
    qryPedidoReferencia: TStringField;
    qryPedidoNumeroPedido: TIntegerField;
    qryPedidoDataEmissao: TDateField;
    qryPedidoCodigoCliente: TIntegerField;
    qryPedidoTotalPedido: TFMTBCDField;
    qryItensCodigoPedido: TIntegerField;
    qryItensCodigoProduto: TIntegerField;
    qryItensQuantidade: TIntegerField;
    qryItensValorUnitario: TFMTBCDField;
    qryItensTotalItem: TFMTBCDField;
    qryPedidoTipoOperacao: TStringField;
  private
    class var FInstance: TDMPrincipal;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TDMPrincipal;
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMPrincipal }

constructor TDMPrincipal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  qryCliente.Connection := TConexao.GetInstance.Connection;
  qryProduto.Connection := TConexao.GetInstance.Connection;
  qryPedido.Connection := TConexao.GetInstance.Connection;
  qryItens.Connection := TConexao.GetInstance.Connection;

  qryCliente.Open;
  qryProduto.Open;
  qryPedido.Open;
  qryItens.Open;
end;

destructor TDMPrincipal.Destroy;
begin
  qryCliente.Free;
  qryProduto.Free;
  qryPedido.Free;
  qryItens.Free;
  inherited;
end;

class function TDMPrincipal.GetInstance: TDMPrincipal;
begin
  if not Assigned(FInstance) then
    FInstance := TDMPrincipal.Create(nil);
  Result := FInstance;
end;

end.
