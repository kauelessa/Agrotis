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
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtCodPedido: TDBEdit;
    DBGrid1: TDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cbTipoOpera��o: TComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
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
    sbBuscar: TSpeedButton;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    Panel9: TPanel;
    Label23: TLabel;
    DBGrid5: TDBGrid;
    sbAdicionar: TSpeedButton;
    edtNomeCliente: TEdit;
    edtCep: TEdit;
    edtLogradouro: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtUF: TEdit;
    edtIBGE: TEdit;
    edtDescProduto: TEdit;
    edtReferencia: TEdit;
    edtNumPedido: TEdit;
    edtDataEmissao: TEdit;
    edtCodClientePedido: TEdit;
    edtTotalPedido: TEdit;
    sbRemover: TSpeedButton;
    edtQuantidade: TEdit;
    edtValorUnitario: TEdit;
    sbAlterarItem: TSpeedButton;
    sbCancelarItem: TSpeedButton;
    procedure sbAlterarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbBuscarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure pcPrincipalChange(Sender: TObject);
    procedure sbAdicionarClick(Sender: TObject);
    procedure sbRemoverClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbAlterarItemClick(Sender: TObject);
    procedure sbCancelarItemClick(Sender: TObject);
  private
    { Private declarations }
    FAlterarItem: Boolean;
    procedure ReadOnlyCliente(ATrue: Boolean; AIgnorePage: Boolean = False);
    procedure ReadOnlyProduto(ATrue: Boolean; AIgnorePage: Boolean = False);
    procedure ReadOnlyPedido(ATrue: Boolean; AIgnorePage: Boolean = False);
    procedure OnBuscarCep(ACEP: TCEP);
    procedure AlterarCliente;
    procedure AlterarProduto;
    procedure AlterarPedido;
    procedure AlterarItem;
    procedure SalvarCliente;
    procedure SalvarProduto;
    procedure SalvarPedido;
    procedure SalvarItem(Alterar: Boolean = False);
    procedure FiltrarItens;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

{ TViewPrincipal }

procedure TViewPrincipal.AlterarCliente;
begin
  with TDMPrincipal.GetInstance do
  begin
    with TCliente.GetInstance do
    begin
      Nome := qryCliente.FieldByName('Nome').AsString;
      CEP.CEP := qryCliente.FieldByName('CEP').AsString;
      CEP.Logradouro := qryCliente.FieldByName('Logradouro').AsString;
      CEP.Complemento := qryCliente.FieldByName('Complemento').AsString;
      CEP.Bairro := qryCliente.FieldByName('Bairro').AsString;
      CEP.Localidade := qryCliente.FieldByName('Cidade').AsString;
      CEP.UF := qryCliente.FieldByName('UF').AsString;
      CEP.IBGE := qryCliente.FieldByName('CodigoIBGE').AsString;

      edtNomeCliente.Text := Nome;
      edtCep.Text := CEP.CEP;
      edtLogradouro.Text := CEP.Logradouro;
      edtComplemento.Text := CEP.Complemento;
      edtBairro.Text := CEP.Bairro;
      edtCidade.Text := CEP.Localidade;
      edtUF.Text := CEP.UF;
      edtIBGE.Text := CEP.IBGE;
    end;
  end;
end;

procedure TViewPrincipal.AlterarItem;
begin
  with TDMPrincipal.GetInstance do
  begin
    with TItem.GetInstance do
    begin
      CodigoPedido := qryItens.FieldByName('CodigoPedido').AsInteger;
      CodigoProduto := qryItens.FieldByName('CodigoProduto').AsInteger;
      Quantidade := qryItens.FieldByName('Quantidade').AsInteger;
      ValorUnitario := qryItens.FieldByName('ValorUnitario').AsExtended;
      TotalItem := qryItens.FieldByName('TotalItem').AsExtended;

      edtQuantidade.Text := IntToStr(Quantidade);
      edtValorUnitario.Text := FloatToStr(ValorUnitario);
      FAlterarItem := True;
    end;
  end;
end;

procedure TViewPrincipal.AlterarPedido;
begin
  with TDMPrincipal.GetInstance do
  begin
    with TPedido.GetInstance do
    begin
      CodigoCliente := qryPedido.FieldByName('CodigoCliente').AsInteger;
      NumeroPedido := qryPedido.FieldByName('NumeroPedido').AsInteger;
      Referencia := qryPedido.FieldByName('Referencia').AsString;
      TipoOperacao := qryPedido.FieldByName('TipoOperacao').AsString;
      DataEmissao := qryPedido.FieldByName('DataEmissao').AsDateTime;
      TotalPedido := qryPedido.FieldByName('TotalPedido').AsExtended;

      edtCodCliente.Text := IntToStr(CodigoCliente);
      edtNumPedido.Text := IntToStr(NumeroPedido);
      edtReferencia.Text := Referencia;
      cbTipoOpera��o.ItemIndex := cbTipoOpera��o.Items.IndexOf(TipoOperacao);
      edtDataEmissao.Text := DateToStr(DataEmissao);
      edtTotalPedido.Text := FloatToStr(TotalPedido);
    end;
  end;
end;

procedure TViewPrincipal.AlterarProduto;
begin
  TProduto.GetInstance.Descricao := TDMPrincipal.GetInstance.qryProduto.FieldByName('Descricao').AsString;
  edtDescProduto.Text := TProduto.GetInstance.Descricao;
end;

procedure TViewPrincipal.DBGrid1CellClick(Column: TColumn);
begin
  TDMPrincipal.GetInstance.qryItens.Locate('CodigoPedido;CodigoProduto',
    VarArrayOf([dsItens.DataSet.FieldByName('CodigoPedido').AsInteger,
      dsItens.DataSet.FieldByName('CodigoProduto').AsInteger]),[]);
end;

procedure TViewPrincipal.DBGrid2CellClick(Column: TColumn);
begin
  TDMPrincipal.GetInstance.qryCliente.Locate('CodigoCliente',dsCliente.DataSet.FieldByName('CodigoCliente').AsInteger,[]);
end;

procedure TViewPrincipal.DBGrid3CellClick(Column: TColumn);
begin
  TDMPrincipal.GetInstance.qryProduto.Locate('CodigoProduto',dsProduto.DataSet.FieldByName('CodigoProduto').AsInteger,[]);
end;

procedure TViewPrincipal.DBGrid4CellClick(Column: TColumn);
begin
  TDMPrincipal.GetInstance.qryPedido.Locate('Codigo',dsPedido.DataSet.FieldByName('Codigo').AsInteger,[]);
  FiltrarItens;
end;

procedure TViewPrincipal.edtCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    sbBuscarClick(sbBuscar);
end;

procedure TViewPrincipal.FiltrarItens;
begin
  dsItens.DataSet.Filtered := False;
  dsItens.DataSet.Filter := 'CodigoPedido = '+IntToStr(dsPedido.DataSet.FieldByName('Codigo').AsInteger);
  dsItens.DataSet.Filtered := True;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  pcPrincipal.TabIndex := 0;
  TControllerCliente.GetInstance.OnBuscarCep := OnBuscarCep;
  FAlterarItem := False;
  FiltrarItens;
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  ReadOnlyCliente(True,True);
  ReadOnlyProduto(True,True);
  ReadOnlyPedido(True,True);
  LimparCampos;
end;

procedure TViewPrincipal.LimparCampos;
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[I] is TEdit then
      TEdit(Self.Components[I]).Text := '';
  end;
end;

procedure TViewPrincipal.OnBuscarCep(ACEP: TCEP);
begin
  edtCep.Text := ACEP.CEP;
  edtLogradouro.Text := ACEP.Logradouro;
  edtComplemento.Text := ACEP.Complemento;
  edtBairro.Text := ACEP.Bairro;
  edtCidade.Text := ACEP.Localidade;
  edtUF.Text := ACEP.UF;
  edtIBGE.Text := ACEP.IBGE;
end;

procedure TViewPrincipal.pcPrincipalChange(Sender: TObject);
begin
  if pcPrincipal.TabIndex = 3 then
    pnlBotoes.Visible := False
  else
    pnlBotoes.Visible := True;
end;

procedure TViewPrincipal.SalvarCliente;
begin
  TCliente.GetInstance.Nome := edtNomeCliente.Text;
end;

procedure TViewPrincipal.SalvarPedido;
begin
  with TPedido.GetInstance do
  begin
    CodigoCliente := StrToInt(edtCodClientePedido.Text);
    NumeroPedido := StrToInt(edtNumPedido.Text);
    Referencia := edtReferencia.Text;
    TipoOperacao := cbTipoOpera��o.Text;
    DataEmissao := Now;
    if edtTotalPedido.Text = '' then
      TotalPedido := 0
    else
      TotalPedido := StrToFloat(edtTotalPedido.Text);
  end;
end;

procedure TViewPrincipal.SalvarProduto;
begin
  TProduto.GetInstance.Descricao := edtDescProduto.Text;
end;

procedure TViewPrincipal.SalvarItem(Alterar: Boolean);
begin
  with TItem.GetInstance do
  begin
    if not Alterar then
      CodigoProduto := dsProduto.DataSet.FieldByName('CodigoProduto').AsInteger;
    CodigoPedido := dsPedido.DataSet.FieldByName('Codigo').AsInteger;
    Quantidade := StrToIntDef(edtQuantidade.Text,0);
    ValorUnitario := StrToFloatDef(edtValorUnitario.Text,0);
    TotalItem := Quantidade * ValorUnitario;
  end;
end;

procedure TViewPrincipal.ReadOnlyCliente(ATrue: Boolean; AIgnorePage: Boolean);
begin
  if (pcPrincipal.TabIndex = 0) or (AIgnorePage) then
  begin
    edtNomeCliente.ReadOnly := ATrue;
    edtCEP.ReadOnly := ATrue;
    sbBuscar.Enabled := not ATrue;
    if pcPrincipal.TabIndex = 0 then
      edtNomeCliente.SetFocus;
  end;
end;

procedure TViewPrincipal.ReadOnlyProduto(ATrue: Boolean; AIgnorePage: Boolean);
begin
  if (pcPrincipal.TabIndex = 1) or (AIgnorePage) then
  begin
    edtDescProduto.ReadOnly := ATrue;
    if pcPrincipal.TabIndex = 1 then
      edtDescProduto.SetFocus;
  end;
end;

procedure TViewPrincipal.ReadOnlyPedido(ATrue: Boolean; AIgnorePage: Boolean);
begin
  if (pcPrincipal.TabIndex = 2) or (AIgnorePage) then
  begin
    edtReferencia.ReadOnly := ATrue;
    edtNumPedido.ReadOnly := ATrue;
    edtCodCliente.ReadOnly := ATrue;
    cbTipoOpera��o.Enabled := not ATrue;
    if pcPrincipal.TabIndex = 2 then
      edtReferencia.SetFocus;
  end;
end;

procedure TViewPrincipal.sbAdicionarClick(Sender: TObject);
begin
  TControllerItens.GetInstance.Insert;
  SalvarItem(FAlterarItem);
  TControllerItens.GetInstance.Salvar(TItem.GetInstance);
  dsItens.DataSet.Refresh;
  FAlterarItem := False;
end;

procedure TViewPrincipal.sbAlterarClick(Sender: TObject);
begin
  try
    case pcPrincipal.TabIndex of
      0:
      begin
        AlterarCliente;
        TControllerCliente.GetInstance.Edit;
      end;
      1:
      begin
        AlterarProduto;
        TControllerProduto.GetInstance.Edit;
      end;
      2:
      begin
        AlterarPedido;
        TControllerPedido.GetInstance.Edit;
      end;
    end;
  finally
    ReadOnlyCliente(False);
    ReadOnlyProduto(False);
    ReadOnlyPedido(False);
    sbNovo.Enabled := False;
    sbAlterar.Enabled := False;
    sbExcluir.Enabled := False;
  end;
end;

procedure TViewPrincipal.sbCancelarClick(Sender: TObject);
begin
  TControllerCliente.GetInstance.Cancelar;
  TControllerProduto.GetInstance.Cancelar;
  TControllerPedido.GetInstance.Cancelar;
  ReadOnlyCliente(True);
  ReadOnlyProduto(True);
  ReadOnlyPedido(True);
  sbNovo.Enabled := True;
  sbAlterar.Enabled := True;
  sbExcluir.Enabled := True;
  dsCliente.DataSet.Refresh;
  dsProduto.DataSet.Refresh;
  dsPedido.DataSet.Refresh;
  LimparCampos;
end;

procedure TViewPrincipal.sbCancelarItemClick(Sender: TObject);
begin
  TControllerItens.GetInstance.Cancelar;
  dsItens.DataSet.Refresh;
  LimparCampos;
end;

procedure TViewPrincipal.sbExcluirClick(Sender: TObject);
begin
  try
    case pcPrincipal.TabIndex of
      0:
      begin
        TControllerCliente.GetInstance.Excluir(dsCliente.DataSet.FieldByName('CodigoCliente').AsInteger);
        dsCliente.DataSet.Refresh;
      end;
      1:
      begin
        TControllerProduto.GetInstance.Excluir(dsProduto.DataSet.FieldByName('CodigoProduto').AsInteger);
        dsProduto.DataSet.Refresh;
      end;
      2:
      begin
        TControllerPedido.GetInstance.Excluir(dsPedido.DataSet.FieldByName('Codigo').AsInteger);
        dsPedido.DataSet.Refresh;
      end;
    end;
  finally
    ReadOnlyCliente(True);
    ReadOnlyProduto(True);
    ReadOnlyPedido(True);
    sbNovo.Enabled := True;
    sbAlterar.Enabled := True;
    sbExcluir.Enabled := True;
    sbBuscar.Enabled := False;
  end;
end;

procedure TViewPrincipal.sbNovoClick(Sender: TObject);
begin
  try
    case pcPrincipal.TabIndex of
      0:
      begin
        LimparCampos;
        TControllerCliente.GetInstance.Insert;
      end;
      1:
      begin
        LimparCampos;
        TControllerProduto.GetInstance.Insert;
      end;
      2:
      begin
        LimparCampos;
        TControllerPedido.GetInstance.Insert;
      end;
    end;
  finally
    ReadOnlyCliente(False);
    ReadOnlyProduto(False);
    ReadOnlyPedido(False);
    sbNovo.Enabled := False;
    sbAlterar.Enabled := False;
    sbExcluir.Enabled := False;
    sbBuscar.Enabled := True;
  end;
end;

procedure TViewPrincipal.sbRemoverClick(Sender: TObject);
begin
  TControllerItens.GetInstance.Excluir(dsItens.DataSet.FieldByName('CodigoPedido').AsInteger,
    dsItens.DataSet.FieldByName('CodigoProduto').AsInteger);
  dsItens.DataSet.Refresh;
end;

procedure TViewPrincipal.sbSalvarClick(Sender: TObject);
var
  b: Boolean;
begin
  try
    case pcPrincipal.TabIndex of
      0:
      begin
        SalvarCliente;
        TControllerCliente.GetInstance.Salvar(TCliente.GetInstance);
        dsCliente.DataSet.Refresh;
      end;
      1:
      begin
        SalvarProduto;
        TControllerProduto.GetInstance.Salvar(TProduto.GetInstance);
        dsProduto.DataSet.Refresh;
      end;
      2:
      begin
        SalvarPedido;
        TControllerPedido.GetInstance.Salvar(TPedido.GetInstance);
        dsPedido.DataSet.Refresh;
      end;
    end;
    ShowMessage('Salvo com sucesso');
  finally
    ReadOnlyCliente(True);
    ReadOnlyProduto(True);
    ReadOnlyPedido(True);
    sbNovo.Enabled := True;
    sbAlterar.Enabled := True;
    sbExcluir.Enabled := True;
    sbBuscar.Enabled := False;
  end;
end;

procedure TViewPrincipal.sbAlterarItemClick(Sender: TObject);
begin
  AlterarItem;
  TControllerItens.GetInstance.Edit;
end;

procedure TViewPrincipal.sbBuscarClick(Sender: TObject);
begin
  TControllerCliente.GetInstance.BuscarCEP(edtCEP.Text);
end;

end.
