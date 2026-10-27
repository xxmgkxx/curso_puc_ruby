# Rode com:  ruby aula2/exemplos/03_objetos.rb
#
# Classe é uma forma de juntar dados e comportamento no mesmo lugar.

class Produto
  attr_reader :nome, :preco_em_centavos

  def initialize(nome, preco_em_centavos)
    @nome = nome
    @preco_em_centavos = preco_em_centavos
  end

  def preco_em_reais
    preco_em_centavos / 100.0
  end

  def caro?
    preco_em_centavos > 900
  end

  def to_s
    "#{nome} (R$ #{format('%.2f', preco_em_reais)})"
  end
end

alface = Produto.new("alface", 450)
tomate = Produto.new("tomate", 990)

puts alface.nome
puts alface.preco_em_reais
puts alface.caro?    # false
puts tomate.caro?    # true
puts tomate          # usa o to_s

# @nome é uma variável de instância: pertence àquele objeto.
# attr_reader :nome criou o método de leitura. Sem ele, alface.nome daria erro.

produtos = [alface, tomate, Produto.new("mel", 2400)]
p produtos.select(&:caro?).map(&:nome)   # &:caro? é atalho para { |p| p.caro? }
