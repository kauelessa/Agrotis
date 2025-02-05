unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Model.Cliente,
  Model.Produto,
  Model.Pedido,
  Model.Item,
  Model.CEP,
  Data.Principal,
  Controller.Cliente,
  Controller.Produto,
  Controller.Pedido,
  Controller.Itens;
type
  TViewPrincipal = class(TForm)
    pnlFundos: TPanel;
    pnlBotoes: TPanel;
    sbCancelar: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbAlterar: TSpeedButton;
    sbNovo: TSpeedButton;
    pcPrincipal: TPageControl;
    tabCliente: TTabSheet;
    TabProduto: TTabSheet;
    TabPedido: TTabSheet;
    TabItens: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtCodCliente: TDBEdit;
    edtNomeCliente: TDBEdit;
    edtCEP: TDBEdit;
    edtLogradouro: TDBEdit;
    edtComplemento: TDBEdit;
    edtBairro: TDBEdit;
    edtCidade: TDBEdit;
    edtUF: TDBEdit;
    edtCodIBGE: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCodProduto: TDBEdit;
    edtDescProduto: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtCodPedido: TDBEdit;
    DBGrid1: TDBGrid;
    Label13: TLabel;
    edtReferencia: TDBEdit;
    Label14: TLabel;
    edtNumPedido: TDBEdit;
    Label15: TLabel;
    edtDataEmissao: TDBEdit;
    Label16: TLabel;
    edtCodClientePedido: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    edtTotalPedido: TDBEdit;
    cbTipoOperação: TComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    edtQuantidade: TDBEdit;
    edtValorUnitario: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    dsCliente: TDataSource;
    dsProduto: TDataSource;
    dsPedido: TDataSource;
    dsItens: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    sbBuscar: TSpeedButton;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    Panel9: TPanel;
    Label23: TLabel;
    Edit2: TEdit;
    DBGrid5: TDBGrid;
    sbBuscarProduto: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure sbAlterarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbBuscarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ReadOnlyCliente(ATrue: Boolean = True);
    procedure ReadOnlyProduto(ATrue: Boolean = True);
    procedure ReadOnlyPedido(ATrue: Boolean = True);
    procedure ReadOnlyItens(ATrue: Boolean = True);
    procedure OnBuscarCep(ACEP: TCEP);
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

{ TViewPrincipal }

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  pcPrincipal.TabIndex := 0;
  TControllerCliente.GetInstance.OnBuscarCep := OnBuscarCep;
end;

procedure TViewPrincipal.OnBuscarCep(ACEP: TCEP);
begin
  edtLogradouro.Text := ACEP.Logradouro;
  edtComplemento.Text := ACEP.Complemento;
  edtBairro.Text := ACEP.Bairro;
  edtCidade.Text := ACEP.Localidade;
  edtUF.Text := ACEP.UF;
  edtCodIBGE.Text := ACEP.IBGE;
end;

procedure TViewPrincipal.ReadOnlyCliente(ATrue: Boolean);
begin
  edtNomeCliente.ReadOnly := ATrue;
  edtCEP.ReadOnly := ATrue;
  sbBuscar.Enabled := not ATrue;
  edtNomeCliente.SetFocus;
end;

procedure TViewPrincipal.ReadOnlyProduto(ATrue: Boolean);
begin
  edtDescProduto.ReadOnly := ATrue;
  edtDescProduto.SetFocus;
end;

procedure TViewPrincipal.ReadOnlyPedido(ATrue: Boolean);
begin
    //
end;

procedure TViewPrincipal.ReadOnlyItens(ATrue: Boolean);
begin
//
end;

procedure TViewPrincipal.sbAlterarClick(Sender: TObject);
begin
  try
    Edit1.SetFocus;
    case pcPrincipal.TabIndex of
      0: TControllerCliente.GetInstance.Edit;
      1: TControllerProduto.GetInstance.Edit;
      2: TControllerPedido.GetInstance.Edit;
      3: TControllerItens.GetInstance.Edit;
    end;
  finally
    case pcPrincipal.TabIndex of
      0:ReadOnlyCliente(False);
      1:ReadOnlyProduto(False);
      2:ReadOnlyPedido(False);
      3:ReadOnlyItens(False);
    end;
    sbNovo.Enabled := False;
    sbAlterar.Enabled := False;
    sbExcluir.Enabled := False;
    dsCliente.DataSet.Refresh;
  end;
end;

procedure TViewPrincipal.sbCancelarClick(Sender: TObject);
begin
  TControllerCliente.GetInstance.Cancelar;
  TControllerProduto.GetInstance.Cancelar;
  TControllerPedido.GetInstance.Cancelar;
  TControllerItens.GetInstance.Cancelar;
  case pcPrincipal.TabIndex of
    0:ReadOnlyCliente(True);
    1:ReadOnlyProduto(True);
    2:ReadOnlyPedido(True);
    3:ReadOnlyItens(True);
  end;
  sbNovo.Enabled := True;
  sbAlterar.Enabled := True;
  sbExcluir.Enabled := True;
  dsCliente.DataSet.Refresh;
  Edit1.SetFocus;
end;

procedure TViewPrincipal.sbExcluirClick(Sender: TObject);
begin
  try
    Edit1.SetFocus;
    case pcPrincipal.TabIndex of
      0:
      begin
        TControllerCliente.GetInstance.Excluir(dsCliente.DataSet.FieldByName('CodigoCliente').AsInteger);
        dsCliente.DataSet.Refresh;
      end;
      1: TControllerProduto.GetInstance.Excluir(dsProduto.DataSet.FieldByName('CodigoProduto').AsInteger);
      2: TControllerPedido.GetInstance.Excluir(dsPedido.DataSet.FieldByName('Codigo').AsInteger);
//      3: TControllerItens.GetInstance.Excluir(ds.DataSet.FieldByName('CodigoPedido').AsInteger);
    end;
  finally
    case pcPrincipal.TabIndex of
      0:ReadOnlyCliente(True);
      1:ReadOnlyProduto(True);
      2:ReadOnlyPedido(True);
      3:ReadOnlyItens(True);
    end;
    sbNovo.Enabled := True;
    sbAlterar.Enabled := True;
    sbExcluir.Enabled := True;
    sbBuscar.Enabled := False;
    Edit1.SetFocus;
  end;
end;

procedure TViewPrincipal.sbNovoClick(Sender: TObject);
begin
  try
    Edit1.SetFocus;
    case pcPrincipal.TabIndex of
      0:
      begin
        dsCliente.DataSet.Append;
        TControllerCliente.GetInstance.Edit;
      end;
      1: dsProduto.DataSet.Append;
      2: dsPedido.DataSet.Append;
    end;
  finally
    case pcPrincipal.TabIndex of
      0:ReadOnlyCliente(False);
      1:ReadOnlyProduto(False);
      2:ReadOnlyPedido(False);
    end;
    sbNovo.Enabled := False;
    sbAlterar.Enabled := False;
    sbExcluir.Enabled := False;
    sbBuscar.Enabled := True;
  end;
end;

procedure TViewPrincipal.sbSalvarClick(Sender: TObject);
begin
  try
    Edit1.SetFocus;
    case pcPrincipal.TabIndex of
      0:
      begin
        TControllerCliente.GetInstance.Salvar(TCliente.GetInstance);
        dsCliente.DataSet.Refresh;
      end;
      1:
      begin
        TControllerProduto.GetInstance.Salvar(TProduto.GetInstance);
        dsProduto.DataSet.Refresh;
      end;
      2:
      begin
        TControllerPedido.GetInstance.Salvar(TPedido.GetInstance);
        dsPedido.DataSet.Refresh;
      end;
      3:
      begin
        TControllerItens.GetInstance.Salvar(TItem.GetInstance);
        dsItens.DataSet.Refresh;
      end;
    end;
    ShowMessage('Salvo com sucesso');
  finally
    case pcPrincipal.TabIndex of
      0:ReadOnlyCliente(True);
      1:ReadOnlyProduto(True);
      2:ReadOnlyPedido(True);
      3:ReadOnlyItens(True);
    end;
    sbNovo.Enabled := True;
    sbAlterar.Enabled := True;
    sbExcluir.Enabled := True;
    sbBuscar.Enabled := False;
    Edit1.SetFocus;
  end;
end;

procedure TViewPrincipal.sbBuscarClick(Sender: TObject);
begin
  TControllerCliente.GetInstance.BuscarCEP(edtCEP.Text);
end;

end.
