unit Classe.Singleton;

interface

type
  TSingleton<T:class> = class
    private
      class var FInstance: T;
    public
      class function GetInstance: T;
  end;

implementation

{ TSingleton<T> }

class function TSingleton<T>.GetInstance: T;
begin
  if not Assigned(FInstance) then
    FInstance := TClass(T).Create as T;
  Result := FInstance;
end;

end.
