# Coloca todos os nomes de produtores em maiúsculas.
#
# @param produtores [Array<String>] nomes dos produtores
# @return [Array<String>] nomes em maiúsculas
def nomes_em_maiusculas(produtores)
  produtores.each do |nome|
    nome.upcase
  end
end
