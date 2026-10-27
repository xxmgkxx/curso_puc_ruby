# Rode com:  ruby aula2/exemplos/01_blocos.rb
#
# Bloco é um pedaço de código que você entrega para um método executar.
# É o que está entre do...end ou entre { }.

produtos = [
  { nome: "alface",  preco: 450, ativo: true },
  { nome: "tomate",  preco: 990, ativo: true },
  { nome: "cenoura", preco: 620, ativo: false }
]

# each: percorre e NÃO devolve nada útil (devolve a lista original).
produtos.each { |produto| puts produto[:nome] }

# map: TRANSFORMA cada item e devolve uma lista NOVA.
nomes = produtos.map { |produto| produto[:nome] }
p nomes

# ARMADILHA: usar each achando que ele transforma. Compare:
com_each = produtos.each { |produto| produto[:nome] }
com_map  = produtos.map  { |produto| produto[:nome] }
p com_each.first   # o hash inteiro: each devolveu a lista original
p com_map.first    # "alface": map devolveu a transformação

# select: FILTRA, ficando com quem responde true.
ativos = produtos.select { |produto| produto[:ativo] }
p ativos.map { |produto| produto[:nome] }

# reject: o contrário do select.
inativos = produtos.reject { |produto| produto[:ativo] }
p inativos.map { |produto| produto[:nome] }

# sum, count, min_by, max_by, sort_by
puts produtos.sum { |produto| produto[:preco] }
puts produtos.count { |produto| produto[:ativo] }
p    produtos.max_by { |produto| produto[:preco] }[:nome]
p    produtos.sort_by { |produto| produto[:preco] }.map { |produto| produto[:nome] }

# group_by: agrupa em um hash.
por_status = produtos.group_by { |produto| produto[:ativo] }
p por_status.keys
p por_status[true].size
