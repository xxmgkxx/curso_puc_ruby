# Rode com:  rails runner ../exemplos/01_modelo.rb
# (de dentro da pasta aula4/feira, depois do rails db:seed)
#
# Produto é o modelo: a classe da aula 3, agora ligada a uma tabela do banco de dados.
# O Rails lê as colunas da tabela e cria um método de leitura para cada coluna.

# count conta as linhas da tabela.
puts Produto.count                                # 4

# first devolve a primeira linha. Cada coluna é um método, sem attr_reader.
alface = Produto.first
puts alface.nome                                  # alface
puts alface.preco_em_centavos                     # 450

# find_by devolve a primeira linha com o valor pedido, ou nil. É o find da aula 3.
# Na aula 3:  produtos.find { |produto| produto[:id] == 2 }
puts Produto.find_by(id: 2).nome                  # tomate
p    Produto.find_by(id: 99)                      # nil

# where devolve todas as linhas com o valor pedido. É o select da aula 2.
# Na aula 3:  produtos.select { |produto| produto[:nome] == "mel" }
p Produto.where(nome: "mel").map { |produto| produto.preco_em_centavos }   # [2400]

# order ordena as linhas por uma coluna. É o sort_by da aula 2.
p Produto.order(:preco_em_centavos).map { |produto| produto.nome }   # ["alface", "cenoura", "tomate", "mel"]

# Produto.all aceita os blocos da aula 2, como uma lista.
baratos = Produto.all.select { |produto| produto.preco_em_centavos < 500 }
p baratos.map { |produto| produto.nome }          # ["alface"]

# ARMADILHA: find, sem o _by, não devolve nil. Quando o id não existe, ele para o programa.
puts Produto.find(2).nome                         # tomate
# Produto.find(99) para com ActiveRecord::RecordNotFound. No navegador, a página responde 404.
# Conserto: para receber nil, use Produto.find_by(id: 99).

# O banco de dados executa a busca, e não o Ruby. O Rails escreve a busca em SQL.
# O rails console mostra o SQL de cada busca.
