object DMPrincipal: TDMPrincipal
  Height = 480
  Width = 640
  object qryCliente: TFDQuery
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 56
    Top = 80
    object qryClienteCodigoCliente: TFDAutoIncField
      FieldName = 'CodigoCliente'
      Origin = 'CodigoCliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 100
    end
    object qryClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 100
    end
    object qryClienteComplemento: TStringField
      FieldName = 'Complemento'
      Origin = 'Complemento'
      Size = 50
    end
    object qryClienteBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 50
    end
    object qryClienteCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 50
    end
    object qryClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryClienteCodigoIBGE: TStringField
      FieldName = 'CodigoIBGE'
      Origin = 'CodigoIBGE'
      Size = 10
    end
  end
  object qryProduto: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 184
    Top = 80
    object qryProdutoCodigoProduto: TFDAutoIncField
      FieldName = 'CodigoProduto'
      Origin = 'CodigoProduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryProdutoDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Size = 100
    end
  end
  object qryPedido: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PEDIDO')
    Left = 312
    Top = 80
    object qryPedidoCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPedidoReferencia: TStringField
      FieldName = 'Referencia'
      Origin = 'Referencia'
      Size = 50
    end
    object qryPedidoNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
      Origin = 'NumeroPedido'
    end
    object qryPedidoDataEmissao: TDateField
      FieldName = 'DataEmissao'
      Origin = 'DataEmissao'
    end
    object qryPedidoCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
      Origin = 'CodigoCliente'
    end
    object qryPedidoTipoOperacao: TStringField
      FieldName = 'TipoOperacao'
      Origin = 'TipoOperacao'
      Size = 50
    end
    object qryPedidoTotalPedido: TFMTBCDField
      FieldName = 'TotalPedido'
      Origin = 'TotalPedido'
      Precision = 18
      Size = 2
    end
  end
  object qryItens: TFDQuery
    SQL.Strings = (
      'SELECT * FROM ITENS_PEDIDO')
    Left = 440
    Top = 80
    object qryItensCodigoPedido: TIntegerField
      FieldName = 'CodigoPedido'
      Origin = 'CodigoPedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensCodigoProduto: TIntegerField
      FieldName = 'CodigoProduto'
      Origin = 'CodigoProduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
    end
    object qryItensValorUnitario: TFMTBCDField
      FieldName = 'ValorUnitario'
      Origin = 'ValorUnitario'
      Precision = 18
      Size = 2
    end
    object qryItensTotalItem: TFMTBCDField
      FieldName = 'TotalItem'
      Origin = 'TotalItem'
      Precision = 18
      Size = 2
    end
  end
end
