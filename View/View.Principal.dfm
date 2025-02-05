﻿object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 658
  ClientWidth = 1053
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlFundos: TPanel
    Left = 0
    Top = 0
    Width = 1053
    Height = 658
    Align = alClient
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 1049
    ExplicitHeight = 657
    object pnlBotoes: TPanel
      Left = 962
      Top = 1
      Width = 90
      Height = 656
      Align = alRight
      Caption = 'pnlBotoes'
      ShowCaption = False
      TabOrder = 0
      ExplicitLeft = 958
      ExplicitHeight = 655
      object sbSalvar: TSpeedButton
        Left = 1
        Top = 265
        Width = 88
        Height = 88
        Hint = 'Salvar registro'
        Align = alTop
        Caption = '&Salvar'
        ParentShowHint = False
        ShowHint = True
        StyleName = 'Windows'
        OnClick = sbSalvarClick
        ExplicitTop = 1
      end
      object sbExcluir: TSpeedButton
        Left = 1
        Top = 177
        Width = 88
        Height = 88
        Hint = 'Excluir registro'
        Align = alTop
        Caption = '&Excluir'
        ParentShowHint = False
        ShowHint = True
        StyleName = 'Windows'
        OnClick = sbExcluirClick
        ExplicitTop = 1
      end
      object sbAlterar: TSpeedButton
        Left = 1
        Top = 89
        Width = 88
        Height = 88
        Hint = 'Alterar registro'
        Align = alTop
        Caption = '&Alterar'
        ParentShowHint = False
        ShowHint = True
        StyleName = 'Windows'
        OnClick = sbAlterarClick
        ExplicitTop = 1
      end
      object sbNovo: TSpeedButton
        Left = 1
        Top = 1
        Width = 88
        Height = 88
        Hint = 'Novo registro'
        Align = alTop
        Caption = '&Novo'
        ParentShowHint = False
        ShowHint = True
        StyleName = 'Windows'
        OnClick = sbNovoClick
      end
      object sbCancelar: TSpeedButton
        Left = 1
        Top = 353
        Width = 88
        Height = 88
        Hint = 'Cancelar'
        Align = alTop
        Caption = '&Cancelar'
        ParentShowHint = False
        ShowHint = True
        StyleName = 'Windows'
        OnClick = sbCancelarClick
        ExplicitTop = 1
      end
    end
    object pcPrincipal: TPageControl
      Left = 1
      Top = 1
      Width = 961
      Height = 656
      ActivePage = TabPedido
      Align = alClient
      TabOrder = 1
      OnChange = pcPrincipalChange
      ExplicitWidth = 957
      ExplicitHeight = 655
      object tabCliente: TTabSheet
        Caption = 'Cliente'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 626
          Align = alClient
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 0
          ExplicitWidth = 949
          ExplicitHeight = 625
          object Label1: TLabel
            Left = 20
            Top = 15
            Width = 39
            Height = 15
            Caption = 'C'#243'digo'
          end
          object Label2: TLabel
            Left = 20
            Top = 55
            Width = 33
            Height = 15
            Caption = 'Nome'
          end
          object Label3: TLabel
            Left = 20
            Top = 98
            Width = 21
            Height = 15
            Caption = 'CEP'
          end
          object sbBuscar: TSpeedButton
            Left = 147
            Top = 113
            Width = 43
            Height = 23
            Caption = 'Buscar'
            Enabled = False
            StyleName = 'Windows'
            OnClick = sbBuscarClick
          end
          object edtCodCliente: TDBEdit
            Left = 20
            Top = 30
            Width = 121
            Height = 23
            TabStop = False
            DataField = 'CodigoCliente'
            DataSource = dsCliente
            ReadOnly = True
            TabOrder = 2
          end
          object Panel5: TPanel
            Left = 1
            Top = 343
            Width = 951
            Height = 282
            Align = alBottom
            ShowCaption = False
            TabOrder = 3
            ExplicitTop = 342
            ExplicitWidth = 947
            object DBGrid2: TDBGrid
              Left = 1
              Top = 1
              Width = 949
              Height = 280
              Align = alClient
              DataSource = dsCliente
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnCellClick = DBGrid2CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CodigoCliente'
                  Title.Caption = 'C'#243'digo Cliente'
                  Width = 92
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Nome'
                  Width = 76
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CEP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Logradouro'
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Complemento'
                  Width = 91
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Bairro'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Cidade'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UF'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CodigoIBGE'
                  Title.Caption = 'C'#243'digo IBGE'
                  Width = 89
                  Visible = True
                end>
            end
          end
          object Panel8: TPanel
            Left = 1
            Top = 151
            Width = 951
            Height = 192
            Align = alBottom
            ShowCaption = False
            TabOrder = 4
            ExplicitTop = 150
            ExplicitWidth = 947
            object Label4: TLabel
              Left = 20
              Top = 5
              Width = 62
              Height = 15
              Caption = 'Logradouro'
            end
            object Label5: TLabel
              Left = 20
              Top = 53
              Width = 77
              Height = 15
              Caption = 'Complemento'
            end
            object Label6: TLabel
              Left = 20
              Top = 97
              Width = 31
              Height = 15
              Caption = 'Bairro'
            end
            object Label7: TLabel
              Left = 19
              Top = 145
              Width = 37
              Height = 15
              Caption = 'Cidade'
            end
            object Label8: TLabel
              Left = 253
              Top = 145
              Width = 14
              Height = 15
              Caption = 'UF'
            end
            object Label9: TLabel
              Left = 397
              Top = 145
              Width = 66
              Height = 15
              Caption = 'C'#243'digo IBGE'
            end
            object edtLogradouro: TEdit
              Left = 20
              Top = 24
              Width = 500
              Height = 23
              TabStop = False
              TabOrder = 0
            end
            object edtComplemento: TEdit
              Left = 20
              Top = 68
              Width = 500
              Height = 23
              TabStop = False
              TabOrder = 1
            end
            object edtBairro: TEdit
              Left = 20
              Top = 116
              Width = 500
              Height = 23
              TabStop = False
              TabOrder = 2
            end
            object edtCidade: TEdit
              Left = 19
              Top = 163
              Width = 228
              Height = 23
              TabStop = False
              TabOrder = 3
            end
            object edtUF: TEdit
              Left = 253
              Top = 163
              Width = 117
              Height = 23
              TabStop = False
              TabOrder = 4
            end
            object edtIBGE: TEdit
              Left = 397
              Top = 163
              Width = 123
              Height = 23
              TabStop = False
              TabOrder = 5
            end
          end
          object DBNavigator1: TDBNavigator
            Left = 160
            Top = -1
            Width = 225
            Height = 25
            DataSource = dsCliente
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            TabOrder = 5
          end
          object edtNomeCliente: TEdit
            Left = 20
            Top = 69
            Width = 501
            Height = 23
            TabOrder = 0
          end
          object edtCep: TEdit
            Left = 20
            Top = 113
            Width = 121
            Height = 23
            TabOrder = 1
            OnKeyDown = edtCepKeyDown
          end
        end
      end
      object TabProduto: TTabSheet
        Caption = 'Produto'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 626
          Align = alClient
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 0
          object Label10: TLabel
            Left = 20
            Top = 15
            Width = 39
            Height = 15
            Caption = 'C'#243'digo'
          end
          object Label11: TLabel
            Left = 20
            Top = 55
            Width = 43
            Height = 15
            Caption = 'Produto'
          end
          object edtCodProduto: TDBEdit
            Left = 20
            Top = 30
            Width = 121
            Height = 23
            TabStop = False
            DataField = 'CodigoProduto'
            DataSource = dsProduto
            ReadOnly = True
            TabOrder = 1
          end
          object Panel6: TPanel
            Left = 1
            Top = 128
            Width = 951
            Height = 497
            Align = alBottom
            ShowCaption = False
            TabOrder = 2
            object DBGrid3: TDBGrid
              Left = 1
              Top = 1
              Width = 949
              Height = 495
              Align = alClient
              DataSource = dsProduto
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnCellClick = DBGrid3CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CodigoProduto'
                  Title.Caption = 'C'#243'digo Produto'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 64
                  Visible = True
                end>
            end
          end
          object DBNavigator2: TDBNavigator
            Left = 160
            Top = 1
            Width = 210
            Height = 25
            DataSource = dsProduto
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            TabOrder = 3
          end
          object edtDescProduto: TEdit
            Left = 20
            Top = 72
            Width = 501
            Height = 23
            TabOrder = 0
          end
        end
      end
      object TabPedido: TTabSheet
        Caption = 'Pedido'
        ImageIndex = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 626
          Align = alClient
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 0
          object Label12: TLabel
            Left = 20
            Top = 15
            Width = 39
            Height = 15
            Caption = 'C'#243'digo'
          end
          object Label13: TLabel
            Left = 20
            Top = 63
            Width = 55
            Height = 15
            Caption = 'Refer'#234'ncia'
          end
          object Label14: TLabel
            Left = 172
            Top = 63
            Width = 54
            Height = 15
            Caption = 'N'#186' Pedido'
          end
          object Label15: TLabel
            Left = 532
            Top = 63
            Width = 70
            Height = 15
            Caption = 'Data Emiss'#227'o'
          end
          object Label16: TLabel
            Left = 20
            Top = 120
            Width = 96
            Height = 15
            Caption = 'C'#243'digo do Cliente'
          end
          object Label17: TLabel
            Left = 172
            Top = 114
            Width = 78
            Height = 15
            Caption = 'Tipo Opera'#231#227'o'
          end
          object Label18: TLabel
            Left = 532
            Top = 120
            Width = 83
            Height = 15
            Caption = 'Total do Pedido'
          end
          object edtCodPedido: TDBEdit
            Left = 20
            Top = 30
            Width = 121
            Height = 23
            TabStop = False
            DataField = 'Codigo'
            DataSource = dsPedido
            TabOrder = 6
          end
          object cbTipoOperação: TComboBox
            Left = 172
            Top = 135
            Width = 121
            Height = 23
            TabOrder = 4
            Items.Strings = (
              'Entrada'
              'Sa'#237'da')
          end
          object Panel7: TPanel
            Left = 1
            Top = 208
            Width = 951
            Height = 417
            Align = alBottom
            ShowCaption = False
            TabOrder = 7
            object DBGrid4: TDBGrid
              Left = 1
              Top = 1
              Width = 949
              Height = 415
              Align = alClient
              DataSource = dsPedido
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnCellClick = DBGrid4CellClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Codigo'
                  Title.Caption = 'C'#243'digo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Referencia'
                  Title.Caption = 'Refer'#234'ncia'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NumeroPedido'
                  Title.Caption = 'N'#186' Pedido'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DataEmissao'
                  Title.Caption = 'Data Emissao'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CodigoCliente'
                  Title.Caption = 'C'#243'digo Cliente'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TipoOperacao'
                  Title.Caption = 'Tipo Operacao'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TotalPedido'
                  Title.Caption = 'Total Pedido'
                  Width = 64
                  Visible = True
                end>
            end
          end
          object DBNavigator3: TDBNavigator
            Left = 160
            Top = 2
            Width = 225
            Height = 25
            DataSource = dsPedido
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            TabOrder = 8
          end
          object edtReferencia: TEdit
            Left = 20
            Top = 78
            Width = 121
            Height = 23
            TabOrder = 0
            Text = 'edtReferencia'
          end
          object edtNumPedido: TEdit
            Left = 172
            Top = 78
            Width = 121
            Height = 23
            TabOrder = 1
            Text = 'edtNumPedido'
          end
          object edtDataEmissao: TEdit
            Left = 532
            Top = 78
            Width = 121
            Height = 23
            TabStop = False
            ReadOnly = True
            TabOrder = 2
            Text = 'edtDataEmissao'
          end
          object edtCodClientePedido: TEdit
            Left = 20
            Top = 135
            Width = 121
            Height = 23
            TabOrder = 3
            Text = 'edtCodClientePedido'
          end
          object edtTotalPedido: TEdit
            Left = 532
            Top = 135
            Width = 121
            Height = 23
            TabStop = False
            ReadOnly = True
            TabOrder = 5
            Text = 'edtTotalPedido'
          end
        end
      end
      object TabItens: TTabSheet
        Caption = 'Itens'
        ImageIndex = 3
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 953
          Height = 626
          Align = alClient
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 0
          object Label20: TLabel
            Left = 100
            Top = 238
            Width = 62
            Height = 15
            Caption = 'Quantidade'
          end
          object Label21: TLabel
            Left = 260
            Top = 238
            Width = 71
            Height = 15
            Caption = 'Valor Unit'#225'rio'
          end
          object sbAdicionar: TSpeedButton
            Left = 100
            Top = 296
            Width = 121
            Height = 41
            Caption = 'Adicionar'
            StyleName = 'Windows'
            OnClick = sbAdicionarClick
          end
          object sbRemover: TSpeedButton
            Left = 260
            Top = 296
            Width = 121
            Height = 41
            Caption = 'Remover'
            StyleName = 'Windows'
            OnClick = sbRemoverClick
          end
          object sbAlterarItem: TSpeedButton
            Left = 489
            Top = 256
            Width = 121
            Height = 41
            Caption = 'Alterar'
            StyleName = 'Windows'
            OnClick = sbAlterarItemClick
          end
          object sbCancelarItem: TSpeedButton
            Left = 489
            Top = 296
            Width = 121
            Height = 41
            Caption = 'Cancelar'
            StyleName = 'Windows'
            OnClick = sbCancelarItemClick
          end
          object DBGrid1: TDBGrid
            Left = 1
            Top = 376
            Width = 951
            Height = 249
            Align = alBottom
            DataSource = dsItens
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CodigoPedido'
                Title.Caption = 'C'#243'digo Pedido'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CodigoProduto'
                Title.Caption = 'C'#243'digo Produto'
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorUnitario'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TotalItem'
                Title.Caption = 'Total Item'
                Width = 92
                Visible = True
              end>
          end
          object Panel9: TPanel
            Left = 1
            Top = 1
            Width = 951
            Height = 219
            Align = alTop
            ShowCaption = False
            TabOrder = 1
            object Label23: TLabel
              Left = 16
              Top = 8
              Width = 100
              Height = 15
              Caption = 'Selecionar Produto'
            end
            object DBGrid5: TDBGrid
              Left = 1
              Top = 29
              Width = 949
              Height = 189
              Align = alBottom
              DataSource = dsProduto
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
            end
          end
          object edtQuantidade: TEdit
            Left = 100
            Top = 256
            Width = 121
            Height = 23
            TabOrder = 2
            Text = 'edtQuantidade'
          end
          object edtValorUnitario: TEdit
            Left = 260
            Top = 256
            Width = 121
            Height = 23
            TabOrder = 3
            Text = 'edtValorUnitario'
          end
        end
      end
    end
  end
  object dsCliente: TDataSource
    DataSet = DMPrincipal.qryCliente
    Left = 973
    Top = 443
  end
  object dsProduto: TDataSource
    DataSet = DMPrincipal.qryProduto
    Left = 973
    Top = 491
  end
  object dsPedido: TDataSource
    DataSet = DMPrincipal.qryPedido
    Left = 973
    Top = 539
  end
  object dsItens: TDataSource
    DataSet = DMPrincipal.qryItens
    Left = 973
    Top = 587
  end
end
