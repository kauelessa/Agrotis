unit Model.Cliente;

interface

uses
  Classe.Base.Singleton, Model.CEP, System.SysUtils, Rest.Json, System.JSON;

type
  TCliente = class
  private
    FLogradouro: string;
    FBairro: string;
    FUF: string;
    FCodigoIBGE: string;
    FCEP: TCEP;
    FComplemento: string;
    FCodigoCliente: Integer;
    FNome: string;
    FCidade: string;
    class var FInstance: TCliente;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: TCEP);
    procedure SetCidade(const Value: string);
    procedure SetCodigoCliente(const Value: Integer);
    procedure SetCodigoIBGE(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetUF(const Value: string);
  public
    constructor Create;
    property CodigoCliente: Integer read FCodigoCliente write SetCodigoCliente;
    property Nome: string read FNome write SetNome;
    property CEP: TCEP read FCEP write SetCEP;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Complemento: string read FComplemento write SetComplemento;
    property Bairro: string read FBairro write SetBairro;
    property Cidade: string read FCidade write SetCidade;
    property UF: string read FUF write SetUF;
    property CodigoIBGE: string read FCodigoIBGE write SetCodigoIBGE;
    class function GetInstance: TCliente;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  inherited Create;
  CEP := TCEP.GetInstance;
end;

class function TCliente.GetInstance: TCliente;
begin
  if not Assigned(FInstance) then
    FInstance := TCliente.Create;
  Result := FInstance;
end;

procedure TCliente.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TCliente.SetCEP(const Value: TCEP);
begin
  FCEP := Value;
  FLogradouro := FCEP.Logradouro;
  FComplemento := FCEP.Complemento;
  FBairro := FCEP.Bairro;
  FUF := FCEP.UF;
  FCodigoIBGE := FCEP.IBGE;
  FCidade := FCEP.Localidade;
end;

procedure TCliente.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TCliente.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TCliente.SetCodigoIBGE(const Value: string);
begin
  FCodigoIBGE := Value;
end;

procedure TCliente.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TCliente.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
