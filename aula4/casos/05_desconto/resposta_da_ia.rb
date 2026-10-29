# Calcula o total a pagar aplicando um desconto percentual.
#
# @param precos [Array<Float>] preços em reais
# @param desconto_em_porcentagem [Numeric] desconto, por exemplo 10 para 10%
# @return [Float] total a pagar
def total_com_desconto(precos, desconto_em_porcentagem)
  precos.sum { |preco| preco - (preco * desconto_em_porcentagem / 100.0) }
end
