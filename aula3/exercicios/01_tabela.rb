# EXERCÍCIO 1: tabela e id
#
# `produtores` é uma tabela: uma lista de hashes, cada um com :id, :nome e :cidade.
# Os ids não seguem a posição (por exemplo 1, 2 e 5).
#
# 1. `buscar_por_id(produtores, id)` devolve o hash do produtor com esse id.
#    Se nenhum produtor tem o id, devolve nil.
# 2. `nomes_da_cidade(produtores, cidade)` devolve uma lista só com os nomes
#    dos produtores daquela cidade. Se não há nenhum, devolve [].
#
# O que chega em cada parâmetro:
#   produtores: a tabela inteira, uma lista de hashes. Por exemplo:
#     [
#       { id: 1, nome: "Sítio Boa Terra", cidade: "Piracicaba" },
#       { id: 2, nome: "Horta da Vila",   cidade: "Campinas" },
#       { id: 5, nome: "Roça do Zé",      cidade: "Piracicaba" }
#     ]
#   id: um número inteiro, por exemplo 5. O 5 é a Roça do Zé, que está na
#       posição 2 da lista.
#   cidade: um texto, por exemplo "Piracicaba".
#
# O que cada método devolve, com essa tabela:
#   buscar_por_id(produtores, 5)               # { id: 5, nome: "Roça do Zé", cidade: "Piracicaba" }
#   buscar_por_id(produtores, 99)              # nil
#   nomes_da_cidade(produtores, "Piracicaba")  # ["Sítio Boa Terra", "Roça do Zé"]
#   nomes_da_cidade(produtores, "Limeira")     # []
#
# Atenção: o id não é a posição na lista. Procure pelo id, não pelo índice.
# Veja o exemplo 01 da aula.
#
# Verifique com:  ruby bin/verificar aula3 01

def buscar_por_id(produtores, id)
  # escreva aqui
end

def nomes_da_cidade(produtores, cidade)
  # escreva aqui
end
