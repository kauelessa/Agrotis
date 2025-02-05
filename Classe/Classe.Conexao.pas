unit Classe.Conexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, FireDAC.Comp.Client,
  Classe.Base.Singleton;

type
  TConexao = class
  private
    class var FInstance: TConexao;
    FConnection: TFDConnection;
    function GetConnection: TFDConnection;
  public
    property Connection: TFDConnection read GetConnection;
    constructor Create;
    destructor Destroy; override;
    class function GetInstance: TConexao;
  end;

implementation

constructor TConexao.Create;
begin
  inherited Create;
  FConnection := TFDConnection.Create(nil);
  FConnection.DriverName := 'MSSQL';
  FConnection.Params.DriverID := 'MSSQL';
  FConnection.Params.Values['Server'] := 'localhost';
  FConnection.Params.Values['Database'] := 'AGROTIS';
  FConnection.Params.Values ['OSAuthent'] := 'Yes';
  FConnection.LoginPrompt := False;
  FConnection.Connected := True;
end;

function TConexao.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

class function TConexao.GetInstance: TConexao;
begin
  if not Assigned(FInstance) then
    FInstance := TConexao.Create;
  Result := FInstance;
end;

destructor TConexao.Destroy;
begin
  FConnection.Free;
  inherited;
end;

end.
