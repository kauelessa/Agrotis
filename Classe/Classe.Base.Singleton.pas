unit Classe.Base.Singleton;

interface

uses
  System.SysUtils;

type
  TBaseSingleton<T: class, constructor> = class(TObject)
  strict private
    class var FInstance: T;
  public
    class function GetInstance: T;
    class procedure ReleaseInstance;
  end;

implementation

{ TBaseSingleton<T> }

class function TBaseSingleton<T>.GetInstance: T;
begin
  if not Assigned(FInstance) then
    FInstance := T.Create;
  Result := FInstance;
end;

class procedure TBaseSingleton<T>.ReleaseInstance;
begin
  if Assigned(FInstance) then
  begin
    FInstance.Free;
    FInstance := nil;
  end;
end;

end.
