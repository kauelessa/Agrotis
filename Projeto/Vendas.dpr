program Vendas;

uses
  Vcl.Forms,
  View.Principal in '..\View\View.Principal.pas' {ViewPrincipal},
  Classe.Controller in '..\Classe\Classe.Controller.pas',
  Model.Cliente in '..\Model\Model.Cliente.pas',
  Controller.Cliente in '..\Controller\Controller.Cliente.pas',
  Model.CEP in '..\Model\Model.CEP.pas',
  Classe.Base.Singleton in '..\Classe\Classe.Base.Singleton.pas',
  Classe.Singleton in '..\Classe\Classe.Singleton.pas',
  Classe.Conexao in '..\Classe\Classe.Conexao.pas',
  Classe.API.Client in '..\Classe\Classe.API.Client.pas',
  Data.Principal in '..\Data\Data.Principal.pas' {DMPrincipal: TDataModule},
  Controller.Produto in '..\Controller\Controller.Produto.pas',
  Model.Produto in '..\Model\Model.Produto.pas',
  Controller.Itens in '..\Controller\Controller.Itens.pas',
  Controller.Pedido in '..\Controller\Controller.Pedido.pas',
  Model.Pedido in '..\Model\Model.Pedido.pas',
  Model.Item in '..\Model\Model.Item.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
