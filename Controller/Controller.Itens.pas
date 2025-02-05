unit Controller.Itens;

interface

uses
  Classe.Controller, Model.Produto, Model.CEP, Model.Item, System.SysUtils, System.Classes,
  System.JSON, Classe.API.Client, Data.Principal, Data.DB, Vcl.Dialogs,
  REST.Json, System.Generics.Collections, System.Variants;

type
  TControllerItens = class(TClasseController<TItem>)
  private
    class var FInstance: TControllerItens;
    function EditItens: Boolean;
    function InsertItens: Boolean;
    function GetItem: TItem;
  public
    property Edit: Boolean read EditItens;
    property Insert: Boolean read InsertItens;
    property Item: TItem read GetItem;
    procedure Salvar(AObj: TItem); override;
    procedure Excluir(AID: Integer); overload; override;
    procedure Excluir(AID: Integer; ACodProduto:Integer); overload;
    procedure Cancelar; override;
    class function GetInstance: TControllerItens;
  end;

implementation

procedure TControllerItens.Salvar(AObj: TItem);
begin
  try
    with TDMPrincipal.GetInstance do
    begin
      if qryItens.State in [dsEdit, dsInsert] then
      begin
        qryItensCodigoPedido.AsInteger := AObj.CodigoPedido;
        qryItensCodigoProduto.AsInteger := AObj.CodigoProduto;
        qryItensQuantidade.AsInteger := AObj.Quantidade;
        qryItensValorUnitario.AsExtended := AObj.ValorUnitario;
        qryItensTotalItem.AsExtended := AObj.TotalItem;
        qryItens.Post;
        qryItens.Refresh;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Salvar: '+#13#10+E.Message)
  end;
end;

function TControllerItens.EditItens: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryItens.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryItens.Edit;
end;

procedure TControllerItens.Excluir(AID, ACodProduto: Integer);
begin
  with TDMPrincipal.GetInstance do
  begin
    if not (qryItens.State in [dsEdit, dsInsert]) then
    begin
      if qryItens.Locate('CodigoPedido;CodigoProduto',VarArrayOf([AID,ACodProduto]),[]) then
      begin
        qryItens.Delete;
      end;
    end;
  end;
end;

procedure TControllerItens.Excluir(AID: Integer);
begin
  try
    with TDMPrincipal.GetInstance do
    begin
      if not (qryItens.State in [dsEdit, dsInsert]) then
      begin
        qryItens.Delete;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Deletar: '+#13#10+E.Message)
  end;
end;

function TControllerItens.GetItem: TItem;
begin
  Result := TItem.GetInstance;
end;

class function TControllerItens.GetInstance: TControllerItens;
begin
  if not Assigned(FInstance) then
    FInstance := TControllerItens.Create(nil);
  Result := FInstance;
end;

function TControllerItens.InsertItens: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryItens.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryItens.Append;
end;

procedure TControllerItens.Cancelar;
begin
  TDMPrincipal.GetInstance.qryItens.Cancel;
end;

end.
