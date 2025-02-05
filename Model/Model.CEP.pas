unit Model.CEP;

interface

uses
  Classe.Base.Singleton, REST.Json;

type
  TCEP = class
  private
    FLogradouro: string;
    FRegiao: string;
    FIBGE: string;
    FBairro: string;
    FDDD: string;
    FUF: string;
    FCEP: string;
    FSiafi: string;
    FLocalidade: string;
    FUnidade: string;
    FComplemento: string;
    FGIA: string;
    FEstado: string;
    class var FInstance: TCEP;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetDDD(const Value: string);
    procedure SetEstado(const Value: string);
    procedure SetGIA(const Value: string);
    procedure SetIBGE(const Value: string);
    procedure SetLocalidade(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetRegiao(const Value: string);
    procedure SetSiafi(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetUnidade(const Value: string);
  public
    property CEP: string read FCEP write SetCEP;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Complemento: string read FComplemento write SetComplemento;
    property Unidade: string read FUnidade write SetUnidade;
    property Bairro: string read FBairro write SetBairro;
    property Localidade: string read FLocalidade write SetLocalidade;
    property UF: string read FUF write SetUF;
    property Estado: string read FEstado write SetEstado;
    property Regiao: string read FRegiao write SetRegiao;
    property IBGE: string read FIBGE write SetIBGE;
    property GIA: string read FGIA write SetGIA;
    property DDD: string read FDDD write SetDDD;
    property Siafi: string read FSiafi write SetSiafi;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TCEP;
    class function GetInstance: TCEP;
  end;

implementation

{ TCEP }

class function TCEP.FromJsonString(AJsonString: string): TCEP;
begin
  Result := TJson.JsonToObject<TCEP>(AJsonString);
end;

function TCEP.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TCEP.GetInstance: TCEP;
begin
  if not Assigned(FInstance) then
    FInstance := TCEP.Create;
  Result := FInstance;
end;

procedure TCEP.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TCEP.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TCEP.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TCEP.SetDDD(const Value: string);
begin
  FDDD := Value;
end;

procedure TCEP.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TCEP.SetGIA(const Value: string);
begin
  FGIA := Value;
end;

procedure TCEP.SetIBGE(const Value: string);
begin
  FIBGE := Value;
end;

procedure TCEP.SetLocalidade(const Value: string);
begin
  FLocalidade := Value;
end;

procedure TCEP.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TCEP.SetRegiao(const Value: string);
begin
  FRegiao := Value;
end;

procedure TCEP.SetSiafi(const Value: string);
begin
  FSiafi := Value;
end;

procedure TCEP.SetUF(const Value: string);
begin
  FUF := Value;
end;

procedure TCEP.SetUnidade(const Value: string);
begin
  FUnidade := Value;
end;

end.
