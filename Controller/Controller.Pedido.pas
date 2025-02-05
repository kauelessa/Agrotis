unit Controller.Pedido;

interface

uses
  Classe.Controller, Model.Pedido, Model.CEP, System.SysUtils, System.Classes, System.JSON,
  Classe.API.Client, Data.Principal, Data.DB, Vcl.Dialogs, REST.Json;

type
  TControllerPedido = class(TClasseController<TPedido>)
  private
    class var FInstance: TControllerPedido;
    function EditPedido: Boolean;
    function InsertPedido: Boolean;
    function GetPedido: TPedido;
  public
    property Edit: Boolean read EditPedido;
    property Insert: Boolean read InsertPedido;
    property Pedido: TPedido read GetPedido;
    procedure Salvar(AObj: TPedido); override;
    procedure Excluir(AID: Integer); override;
    procedure Cancelar; override;
    class function GetInstance: TControllerPedido;
  end;

implementation

procedure TControllerPedido.Salvar(AObj: TPedido);
begin
  try
    with TDMPrincipal.GetInstance do
    begin
      if qryPedido.State in [dsEdit, dsInsert] then
      begin
        qryPedidoReferencia.AsString := AObj.Referencia;
        qryPedidoNumeroPedido.AsInteger := AObj.NumeroPedido;
        qryPedidoDataEmissao.AsDateTime := AObj.DataEmissao;
        qryPedidoCodigoCliente.AsInteger := AObj.CodigoCliente;
        qryPedidoTipoOperacao.AsString := AObj.TipoOperacao;
        qryPedidoTotalPedido.AsExtended := AObj.TotalPedido;
        qryPedido.Post;
        qryPedido.Refresh;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Salvar: '+#13#10+E.Message)
  end;
end;

function TControllerPedido.EditPedido: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryPedido.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryPedido.Edit;
end;

procedure TControllerPedido.Excluir(AID: Integer);
begin
  try
    with TDMPrincipal.GetInstance do
    begin
      if not (qryPedido.State in [dsEdit, dsInsert]) then
      begin
        if qryPedido.Locate('Codigo',AID,[]) then
        begin
          qryPedido.Delete;
          ShowMessage('Deletado com sucesso');
        end;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Deletar: '+#13#10+E.Message)
  end;
end;

function TControllerPedido.GetPedido: TPedido;
begin
  Result := TPedido.GetInstance;
end;

class function TControllerPedido.GetInstance: TControllerPedido;
begin
  if not Assigned(FInstance) then
    FInstance := TControllerPedido.Create(nil);
  Result := FInstance;
end;

function TControllerPedido.InsertPedido: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryPedido.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryPedido.Append;
end;

procedure TControllerPedido.Cancelar;
begin
  TDMPrincipal.GetInstance.qryPedido.Cancel;
end;

end.
