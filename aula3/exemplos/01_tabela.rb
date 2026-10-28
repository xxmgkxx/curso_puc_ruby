# Rode com:  ruby aula3/exemplos/01_tabela.rb
#
# No exemplo 01 da aula 2 você já filtrou e ordenou uma lista de hashes.
# Isso tem nome: a lista é a TABELA, cada hash é uma LINHA (registro) e cada
# chave é uma COLUNA. O id identifica a linha.

produtos = [
  { id: 1, nome: "alface",  preco_em_centavos: 450,  produtor_id: 1 },
  { id: 2, nome: "tomate",  preco_em_centavos: 990,  produtor_id: 2 },
  { id: 4, nome: "cenoura", preco_em_centavos: 620,  produtor_id: 1 },
  { id: 7, nome: "mel",     preco_em_centavos: 2400, produtor_id: 5 }
]
produtores = [
  { id: 1, nome: "Sítio Boa Terra", cidade: "Piracicaba" },
  { id: 2, nome: "Horta da Vila",   cidade: "Campinas" },
  { id: 5, nome: "Roça do Zé",      cidade: "Piracicaba" }
]

# find (novo) devolve a primeira linha em que o bloco dá true. Serve para buscar pelo id.
tomate = produtos.find { |produto| produto[:id] == 2 }
puts tomate[:nome]          # tomate

# ARMADILHA: produtos[2] é a posição 2 da lista, não o produto com id 2.
puts produtos[2][:nome]     # cenoura  <- o id 2 é o tomate

# Se nenhuma linha dá true, find devolve nil. Cheque antes de usar o resultado.
p produtos.find { |produto| produto[:id] == 99 }   # nil

# select é o "where" do banco de dados. sort_by é o "order by".
baratos = produtos.select { |produto| produto[:preco_em_centavos] < 500 }
p baratos.map { |produto| produto[:nome] }         # ["alface"]
por_preco = produtos.sort_by { |produto| produto[:preco_em_centavos] }
p por_preco.map { |produto| produto[:nome] }       # ["alface", "cenoura", "tomate", "mel"]

# produtor_id guarda o id de uma linha de OUTRA tabela. Responde "de quem é a alface?"
alface = produtos.find { |produto| produto[:nome] == "alface" }
dono = produtores.find { |produtor| produtor[:id] == alface[:produtor_id] }
puts dono[:nome]            # Sítio Boa Terra

# No Rails: cada tabela vira uma tabela do banco de dados e uma classe (Produto).
# produtor_id é a coluna que liga produto a produtor. No modelo ela vira belongs_to.
