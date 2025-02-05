unit Classe.Controller;

interface

uses
  System.Generics.Collections, System.Classes, Data.DB, Data.SqlExpr;

type
  TClasseController<T:class> = class(TComponent)
  protected
    FQuery: TSQLQuery;
  public
    procedure Salvar(AObj: T); virtual; abstract;
    procedure Excluir(AID: Integer); virtual; abstract;
    procedure Cancelar; virtual; abstract;
  end;

implementation

end.
