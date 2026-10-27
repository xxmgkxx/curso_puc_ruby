# Rode com:  ruby aula2/exemplos/04_lendo_codigo_alheio.rb
#
# PROTOCOLO PARA LER UM MÉTODO QUE VOCÊ NÃO ESCREVEU
#
# 1. O que ENTRA? (tipos e formato dos argumentos)
# 2. O que SAI?   (a última linha é o retorno)
# 3. O que ele MUDA por fora? (mutação, escrita em arquivo, banco)
# 4. Quais casos de BORDA ele não trata? (lista vazia, nil, zero, texto inválido)
#
# Aplique no método abaixo antes de rodar.

def resumo_da_feira(vendas)
  total = vendas.sum { |venda| venda[:valor_em_centavos] }
  por_produtor = vendas.group_by { |venda| venda[:produtor] }

  {
    total_em_reais: total / 100.0,
    quantidade: vendas.size,
    ticket_medio_em_reais: total.fdiv(vendas.size) / 100.0,
    produtores: por_produtor.keys.sort
  }
end

vendas = [
  { produtor: "Horta da Vila",   valor_em_centavos: 1200 },
  { produtor: "Sítio Boa Terra", valor_em_centavos: 800 },
  { produtor: "Horta da Vila",   valor_em_centavos: 450 }
]

p resumo_da_feira(vendas)

# Pergunta 4 do protocolo: e se a lista estiver vazia?
# vendas.sum dá 0, vendas.size dá 0, e 0.fdiv(0) dá NaN.
p resumo_da_feira([])   # repare no ticket_medio_em_reais
