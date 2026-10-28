# Rode com:  ruby aula3/exemplos/03_pagina.rb
#
# ERB é HTML com buracos que o Ruby preenche. O Rails monta as páginas assim.

require "erb"   # biblioteca que já vem com o Ruby

# <%= valor %> calcula e INSERE o resultado no texto.
# result_with_hash cria uma variável local para cada chave do hash.
modelo = ERB.new("Olá, <%= nome %>! São <%= 2 + 3 %> caixas.")
puts modelo.result_with_hash(nome: "Zé")   # Olá, Zé! São 5 caixas.

# <% codigo %> EXECUTA o código e não imprime nada. Serve para o each.
lista = ERB.new("<% nomes.each do |nome| %><li><%= nome %></li><% end %>")
puts lista.result_with_hash(nomes: ["alface", "tomate"])   # <li>alface</li><li>tomate</li>

# ARMADILHA: <% %> sem o = roda o código, mas não mostra o resultado.
puts ERB.new("Nome: <% nome %>").result_with_hash(nome: "alface")   # Nome:

# format é o printf do C: "%.2f" mostra duas casas depois do ponto.
puts format("%.2f", 4.5)   # 4.50

# A página: a lista de hashes do exemplo 01 (só as colunas que a página usa).
produtos = [
  { nome: "alface",  preco_em_centavos: 450 },
  { nome: "tomate",  preco_em_centavos: 990 },
  { nome: "cenoura", preco_em_centavos: 620 },
  { nome: "mel",     preco_em_centavos: 2400 }
]

# __dir__ é a pasta deste arquivo. File.join monta o caminho a partir dela
# (".." sobe uma pasta). File.read lê o arquivo inteiro como um texto só.
view = File.join(__dir__, "..", "views", "produtos", "index.html.erb")
html = ERB.new(File.read(view)).result_with_hash(produtos: produtos)

# File.write grava o texto em um arquivo, criando ou trocando.
saida = File.join(__dir__, "..", "pagina.html")
File.write(saida, html)
puts saida
puts "abra no navegador"

# O ERB puro não escapa HTML (um nome com <b> vira tag). O Rails escapa sozinho.
# No Rails: o controller busca @produtos = Produto.all e entrega para a view
# app/views/produtos/index.html.erb. Isso é a aula 4.
