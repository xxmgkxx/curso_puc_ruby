# Aula 3: dos dados à página

O Rails é Ruby organizado em três partes: modelo, view e controller.
Hoje você constrói uma tabela, um modelo e uma view, só com o que vem no Ruby,
e gera uma página HTML. O controller e o servidor entram na aula 4.

## O que você vai aprender

- achar uma linha com `find`, que devolve `nil` quando não existe
- criar uma classe: `class`, `initialize`, `@variavel` e `attr_reader`
- método de instância e método de classe (`def self.all`)
- montar HTML com ERB: `require "erb"`, `<%= %>`, `<% %>` e `result_with_hash`
- formatar número: `format("%.2f", 4.5)`
- ler e gravar arquivos: `File.read`, `File.write`, `File.join` e `__dir__`

## Tabela, linha, coluna e id

Banco de dados guarda dados em tabelas. Quatro palavras bastam por hoje.

- **Tabela**: uma coleção de registros do mesmo tipo. O nome fica no plural: `produtos`.
- **Linha**: um registro, ou seja, um produto. Em Ruby é um hash ou um objeto.
- **Coluna**: uma chave que existe em todas as linhas, como `nome` e `preco_em_centavos`.
- **id**: o número que identifica a linha. Ele não é a posição na lista.

A coluna `produtor_id` guarda o `id` de uma linha de outra tabela. Ela responde
"de quem é a alface?". O Rails chama essa ligação de `belongs_to`.

## Armadilhas de hoje

| Armadilha | O que acontece |
|-----------|----------------|
| `produtos[2]` no lugar do produto com `id` 2 | devolve a posição 2 da lista, que pode ser outro produto |
| `find` com id que não existe | devolve `nil`, e `nil[:nome]` quebra mais adiante |
| classe sem `attr_reader` | `alface.nome` dá `NoMethodError` |
| `<% %>` sem o `=` | executa o código e não mostra nada na página |

## Do Ruby para o Rails

| Hoje | No Rails |
|------|----------|
| lista de hashes (`produtos`) | tabela `produtos` no banco de dados |
| `class Produto` no mesmo arquivo | `app/models/produto.rb` |
| `Produto.all` | `Produto.all` |
| `Produto.find_by_id(2)` | `Produto.find_by(id: 2)` devolve `nil`. `Produto.find(2)` dá erro |
| `select` e `Produto.mais_baratos_que(500)` | `Produto.where(...)`, ou um `scope` com nome |
| `produtor_id` | `belongs_to :produtor` |
| `aula3/views/produtos/index.html.erb` | `app/views/produtos/index.html.erb` |
| `result_with_hash(produtos: produtos)` | o controller entrega `@produtos` para a view (aula 4) |
| `<%= %>` do ERB puro não escapa HTML | o `<%= %>` do Rails escapa sozinho |

## Ordem da manhã

1. Rode e leia os exemplos:
   ```
   ruby aula3/exemplos/01_tabela.rb
   ruby aula3/exemplos/02_classe.rb
   ruby aula3/exemplos/03_pagina.rb
   ```
2. Resolva `aula3/exercicios/`.
3. Verifique:
   ```
   ruby bin/verificar aula3        # todos
   ruby bin/verificar aula3 01     # só o exercício 01
   ```
4. Abra `aula3/pagina.html` no navegador.
