unit Classe.API.Client;

interface

uses
  FireDAC.Comp.Client,
  Vcl.Dialogs,
  IdHTTP,
  IdStack,
  REST.Client,
  REST.Json,
  REST.Response.Adapter,
  REST.Types,
  System.Classes,
  System.JSON,
  System.SysUtils,
  Classe.Base.Singleton;

type
  TApiClient = class
    class var FInstance: TApiClient;
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
    FJSON: TJSONObject;
    FJSONValue: TJSONValue;
    ResponseToDataSet: TRESTResponseDataSetAdapter;
  private
    constructor Create(Sender: TComponent; AURL: string); overload;
  public
    constructor Create(Sender: TComponent; AURL: string; out AMemTable: TFDMemTable); overload;
    function Get(const Endpoint: string): TJSONObject;
    function Post(const Endpoint: string; const Data: TJSONObject): TJSONObject;
    function Put(const Endpoint: string; const Data: TJSONObject): TJSONObject;
    function Delete(const Endpoint: string): TJSONObject;
    procedure SetURL(Sender: TComponent; AURL: string);
    class function GetInstance: TApiClient;
  end;

implementation

{ TApiClient }

constructor TApiClient.Create(Sender: TComponent; AURL: string);
begin
  inherited Create;
  FClient := TRESTClient.Create(Sender);
  SetURL(Sender,AURL);
end;

constructor TApiClient.Create(Sender: TComponent; AURL: string; out AMemTable: TFDMemTable);
begin
  Create(Sender, AURL);
  ResponseToDataSet := TRESTResponseDataSetAdapter.Create(nil);

  ResponseToDataSet.Dataset := AMemTable;
  ResponseToDataSet.Response := FResponse;
end;

function TApiClient.Delete(const Endpoint: string): TJSONObject;
begin
  Result := nil;
  try
    FRequest.Resource := Endpoint;
    FRequest.Method := rmDELETE;
    FRequest.Execute;
    Result := FJSON.ParseJSONValue(FResponse.Content) as TJSONObject;
  except
    on E: EIdHTTPProtocolException do
      ShowMessage('O servidor retornou um erro:'+#10#13+
        'C�digo do erro: '+IntToStr(E.ErrorCode)+#10#13+'Mensagem: '+E.ErrorMessage);
    on E: EIdSocketError do
      ShowMessage('Erro de conex�o com o servidor:'+#10#13+E.Message);
    on E: Exception do
      ShowMessage('Erro inesperado: '+E.Message);
  end;
end;

function TApiClient.Get(const Endpoint: string): TJSONObject;
begin
  Result := nil;
  try
    FRequest.Resource := Endpoint;
    FRequest.Method := rmGET;
    FRequest.Execute;
    Result := FJSON.ParseJSONValue(FResponse.Content) as TJSONObject;
  except
    on E: EIdHTTPProtocolException do
      ShowMessage('O servidor retornou um erro:'+#10#13+
        'C�digo do erro: '+IntToStr(E.ErrorCode)+#10#13+'Mensagem: '+E.ErrorMessage);
    on E: EIdSocketError do
      ShowMessage('Erro de conex�o com o servidor:'+#10#13+E.Message);
    on E: Exception do
      ShowMessage('Erro inesperado: '+E.Message);
  end;
end;

class function TApiClient.GetInstance: TApiClient;
begin
  if not Assigned(FInstance) then
    FInstance := TApiClient.Create(nil,'');
  Result := FInstance;
end;

function TApiClient.Post(const Endpoint: string; const Data: TJSONObject): TJSONObject;
begin
  Result := nil;
  try
    FRequest.Resource := Endpoint;
    FRequest.Method := rmPOST;
    FRequest.AddBody(Data.ToJSON, REST.Types.TRESTContentType.ctAPPLICATION_JSON);
    FRequest.Execute;

    FJSON.ParseJSONValue(FResponse.Content);
    Result := FJSON as TJSONObject;
  except
    on E: EIdHTTPProtocolException do
      ShowMessage('O servidor retornou um erro:'+#10#13+
        'C�digo do erro: '+IntToStr(E.ErrorCode)+#10#13+'Mensagem: '+E.ErrorMessage);
    on E: EIdSocketError do
      ShowMessage('Erro de conex�o com o servidor:'+#10#13+E.Message);
    on E: Exception do
      ShowMessage('Erro inesperado: '+E.Message);
  end;
end;

function TApiClient.Put(const Endpoint: string;
  const Data: TJSONObject): TJSONObject;
begin
  Result := nil;
  try
    FRequest.Resource := Endpoint;
    FRequest.Method := rmPUT;
    FRequest.AddBody(Data.ToJSON, REST.Types.TRESTContentType.ctAPPLICATION_JSON);
    FRequest.Execute;
    FJSON.ParseJSONValue(FResponse.Content);
    Result := FJSON as TJSONObject;
  except
    on E: EIdHTTPProtocolException do
      ShowMessage('O servidor retornou um erro:'+#10#13+
        'C�digo do erro: '+IntToStr(E.ErrorCode)+#10#13+'Mensagem: '+E.ErrorMessage);
    on E: EIdSocketError do
      ShowMessage('Erro de conex�o com o servidor:'+#10#13+E.Message);
    on E: Exception do
      ShowMessage('Erro inesperado: '+E.Message);
  end;
end;

procedure TApiClient.SetURL(Sender: TComponent; AURL: string);
begin
  FClient := TRESTClient.Create(Sender);
  FRequest := TRESTRequest.Create(Sender);
  FResponse := TRESTResponse.Create(Sender);
  FJSON := TJSONObject.Create;
  FJSONValue := nil;

  FClient.Params.Clear;
  FClient.BaseURL := AURL;
  FClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8';
  FClient.AcceptCharSet := 'UTF-8, *;q=0.8';
  FClient.ContentType := 'application/json';
  FClient.HandleRedirects := True;
  FRequest.Params.Clear;
  FRequest.Client := FClient;
  FRequest.Response := FResponse;
  FRequest.SynchronizedEvents := False;
  FResponse.ContentType := 'application/json';
end;

end.

