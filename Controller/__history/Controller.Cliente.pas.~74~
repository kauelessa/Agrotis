unit Controller.Cliente;

interface

uses
  Classe.Controller, Model.Cliente, Model.CEP, System.SysUtils, System.Classes, System.JSON,
  Classe.API.Client, Data.Principal, Data.DB, Vcl.Dialogs, REST.Json;

type
  TOnBuscarCep = procedure(ACEP: TCEP) of object;

  TControllerCliente = class(TClasseController<TCliente>)
  private
    FOnBuscarCep: TOnBuscarCep;
    class var FInstance: TControllerCliente;
    function EditCliente: Boolean;
    function InsertCliente: Boolean;
    function GetCliente: TCliente;
  public
    property Edit: Boolean read EditCliente;
    property Insert: Boolean read InsertCliente;
    property Cliente: TCliente read GetCliente;
    property OnBuscarCep: TOnBuscarCep read FOnBuscarCep write FOnBuscarCep;
    procedure Salvar(AObj: TCliente); override;
    procedure Excluir(AID: Integer); override;
    procedure Cancelar; override;
    procedure BuscarCEP(ACEP: string);
    class function GetInstance: TControllerCliente;
  end;

implementation

procedure TControllerCliente.Salvar(AObj: TCliente);
begin
  try
    with TDMPrincipal.GetInstance do
    begin
      if qryCliente.State in [dsEdit, dsInsert] then
      begin
        qryClienteNome.AsString := AObj.Nome;
        qryClienteCEP.AsString := AObj.CEP.CEP;
        qryClienteLogradouro.AsString := AObj.Logradouro;
        qryClienteComplemento.AsString := AObj.Complemento;
        qryClienteBairro.AsString := AObj.Bairro;
        qryClienteCidade.AsString := AObj.Cidade;
        qryClienteUF.AsString := AObj.UF;
        qryClienteCodigoIBGE.AsString := AObj.CodigoIBGE;
        qryCliente.Post;
        qryCliente.Close;
        qryCliente.Open;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Salvar: '+#13#10+E.Message)
  end;
end;

function TControllerCliente.EditCliente: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryCliente.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryCliente.Edit;
end;

procedure TControllerCliente.Excluir(AID: Integer);
begin
  try
    with TDMPrincipal.GetInstance do
    begin
      if not (qryCliente.State in [dsEdit, dsInsert]) then
      begin
        if qryCliente.Locate('CodigoCliente',AID,[]) then
        begin
          qryCliente.Delete;
          ShowMessage('Deletado com sucesso');
        end;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar Deletar: '+#13#10+E.Message)
  end;
end;

function TControllerCliente.GetCliente: TCliente;
begin
  Result := TCliente.GetInstance;
end;

class function TControllerCliente.GetInstance: TControllerCliente;
begin
  if not Assigned(FInstance) then
    FInstance := TControllerCliente.Create(nil);
  Result := FInstance;
end;

function TControllerCliente.InsertCliente: Boolean;
begin
  Result := True;
  if not (TDMPrincipal.GetInstance.qryCliente.State in [dsEdit, dsInsert]) then
    TDMPrincipal.GetInstance.qryCliente.Append;
end;

procedure TControllerCliente.Cancelar;
begin
  TDMPrincipal.GetInstance.qryCliente.Cancel;
end;

procedure TControllerCliente.BuscarCEP(ACEP: string);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      JSONCEP: string;
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          TApiClient.GetInstance.SetURL(Self,'https://viacep.com.br');
          JSONCEP := TApiClient.GetInstance.Get('/ws/'+ACEP+'/json').ToJSON;
          TCliente.GetInstance.CEP := TCEP.FromJsonString(JSONCEP);
          OnBuscarCep(TCliente.GetInstance.CEP);
        end);
    end).Start;
end;

//Requisição
//https://viacep.com.br/ws/01001000/json/

//Resposta
{
  "cep": "01001-000",
  "logradouro": "Praça da Sé",
  "complemento": "lado ímpar",
  "unidade": "",
  "bairro": "Sé",
  "localidade": "São Paulo",
  "uf": "SP",
  "estado": "São Paulo",
  "regiao": "Sudeste",
  "ibge": "3550308",
  "gia": "1004",
  "ddd": "11",
  "siafi": "7107"
}

//Resposta de erro
{
  "erro": "true"
}



end.
