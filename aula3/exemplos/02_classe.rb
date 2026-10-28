# Rode com:  ruby aula3/exemplos/02_classe.rb
#
# Classe é o molde de um registro: uma struct do C que também carrega métodos.
# Cada Produto.new cria uma linha da tabela do exemplo 01.

class Produto
  # initialize roda no Produto.new. @nome é uma "gaveta": cada objeto tem as suas.
  # attr_reader deixa LER a gaveta de fora (produto.nome).
  attr_reader :id, :nome, :preco_em_centavos
  def initialize(id, nome, preco_em_centavos)
    @id = id
    @nome = nome
    @preco_em_centavos = preco_em_centavos
  end

  # Método de instância: responde sobre UM produto.
  def preco_em_reais
    @preco_em_centavos / 100.0
  end

  # def self.: método de classe, responde sobre a feira inteira.
  def self.all
    [Produto.new(1, "alface", 450), Produto.new(2, "tomate", 990),
     Produto.new(4, "cenoura", 620), Produto.new(7, "mel", 2400)]
  end
  def self.find_by_id(id)
    Produto.all.find { |produto| produto.id == id }
  end
  # O select do exemplo 01 (produto[:preco_em_centavos] < 500), agora com nome.
  def self.mais_baratos_que(centavos)
    Produto.all.select { |produto| produto.preco_em_centavos < centavos }
  end
end

alface = Produto.new(1, "alface", 450)
puts alface.nome                     # alface
# ARMADILHA: sem attr_reader, alface.nome daria NoMethodError.
puts alface.preco_em_reais           # 4.5
puts Produto.all.size                # 4
puts Produto.find_by_id(2).nome      # tomate
p    Produto.find_by_id(99)          # nil
p    Produto.mais_baratos_que(500).map { |produto| produto.nome }   # ["alface"]

# No Rails: a classe fica em app/models/produto.rb e Produto.all lê da tabela.
# find_by(id: 2) devolve nil se não existe, find(2) dá erro. O select vira where.
