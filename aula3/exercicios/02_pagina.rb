# EXERCÍCIO 2: classe e página
#
# Parte 1: crie a classe `Produtor`, do zero. Ela é a linha da tabela de produtores.
#
# 1. `Produtor.new(id, nome, cidade)` guarda os três valores,
#    e `produtor.id`, `produtor.nome` e `produtor.cidade` devolvem cada um.
# 2. `produtor.to_s` devolve o nome e a cidade, como "Sítio Boa Terra (Piracicaba)".
# 3. `Produtor.all` devolve uma lista com 3 objetos Produtor:
#    1 "Sítio Boa Terra" Piracicaba, 2 "Horta da Vila" Campinas
#    e 5 "Roça do Zé" Piracicaba.
#
# Parte 2: a página. Ela usa o Produtor da parte 1.
#
# 4. `pagina_de_produtores(produtores)` recebe uma lista de objetos Produtor
#    e devolve um texto HTML feito com ERB: "<ul>", um "<li>nome (cidade)</li>"
#    para cada produtor, e "</ul>".
#
# O que chega em cada parâmetro:
#   Produtor.new(id, nome, cidade)
#     id: um número inteiro, por exemplo 1.
#     nome: um texto, por exemplo "Sítio Boa Terra".
#     cidade: um texto, por exemplo "Piracicaba".
#   pagina_de_produtores(produtores)
#     produtores: uma lista de objetos Produtor, e não de hashes. Por exemplo:
#       [Produtor.new(1, "Sítio Boa Terra", "Piracicaba"),
#        Produtor.new(2, "Horta da Vila", "Campinas")]
#     Para ler um valor, use produtor.nome, e não produtor[:nome].
#
# Com essa lista, pagina_de_produtores devolve:
#   "<ul><li>Sítio Boa Terra (Piracicaba)</li><li>Horta da Vila (Campinas)</li></ul>"
#
# Atenção: sem `attr_reader`, `produtor.nome` dá NoMethodError.
# Atenção: `<% %>` sem o `=` não mostra nada na página.
# Atenção: o ERB precisa de `require "erb"` no começo do arquivo.
# Veja os exemplos 02 e 03 da aula.
#
# Verifique com:  ruby bin/verificar aula3 02

class Produtor
  # escreva aqui
end

def pagina_de_produtores(produtores)
  # escreva aqui
end
