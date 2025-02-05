unit Controller.Produto;

interface

uses
  Model.Produto, Classe.Controller, Data.Principal, Data.DB, Vcl.Dialogs,
  System.SysUtils, System.Classes;

type
  TControllerProduto = class(TClasseController<TProduto>)
    private
      class var FInstance: TControllerProduto;
      function GetProduto: TProduto;
      function EditProduto: Boolean;
      function InsertProduto: Boolean;
    public
      property Edit: Boolean read EditProduto;
      property Insert: Boolean read InsertProduto;
      property Produto: TProduto read GetProduto;
      procedure Salvar(AObj: TProduto); override;
      procedure Excluir(AID: Integer); override;
      procedure Cancelar; override;
      class function GetInstance: TControllerProduto;
  end;

implementation

{ TControllerProduto }

procedure TControllerProduto.Salvar(AObj: TProduto);
begin
  inherited;
  try
    with TDMPrincipal.GetInstance do
    begin
      if qryProduto.State in [dsEdit, dsInsert] then
      begin
        qryProdutoDescricao.AsString := AObj.Descricao;
        qryProduto.Post;
        qryProduto.Close;
        qryProduto.Open;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Salvar: '+#13#10+E.Message)
  end;
end;

function TControllerProduto.EditProduto: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryProduto.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryProduto.Edit;
end;

procedure TControllerProduto.Excluir(AID: Integer);
begin
  inherited;
  try
    with TDMPrincipal.GetInstance do
    begin
      if not (qryProduto.State in [dsEdit, dsInsert]) then
      begin
        if qryProduto.Locate('CodigoProduto',AID,[]) then
        begin
          qryProduto.Delete;
          ShowMessage('Deletado com sucesso');
        end;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Deletar: '+#13#10+E.Message)
  end;
end;

procedure TControllerProduto.Cancelar;
begin
  inherited;
  TDMPrincipal.GetInstance.qryProduto.Cancel;
end;

class function TControllerProduto.GetInstance: TControllerProduto;
begin
  if not Assigned(FInstance) then
    FInstance := TControllerProduto.Create(nil);
  Result := FInstance;
end;

function TControllerProduto.GetProduto: TProduto;
begin
  Result := TProduto.GetInstance;
end;

function TControllerProduto.InsertProduto: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryProduto.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryProduto.Append;
end;

end.
