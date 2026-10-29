# Aula 4: a feira no Rails

Na aula 3, você passou os dados para a view com quatro passos à mão:
`File.read`, `ERB.new`, `result_with_hash` e `File.write`. Hoje o Rails executa
os quatro passos. Você instala o Rails, cria o app `feira` e abre a página dos
produtos no endereço `http://localhost:3000/produtos`.

## O que você vai aprender

- instalar o Rails e criar um app: `gem install rails` e `rails new`
- criar o modelo e a tabela: `rails generate model` e `rails db:migrate`
- gravar na tabela a lista de hashes da aula 3: `db/seeds.rb` e `rails db:seed`
- buscar no modelo: `find_by`, `where`, `order` e `count`
- ligar um endereço a uma página: a rota, o controller e a view
- iniciar o servidor: `rails server`

## As quatro peças

O Rails divide o app em quatro peças. Cada peça mora numa pasta. O nome MVC vem
das três primeiras peças: Model (modelo), View e Controller.

| Peça | O que faz | Arquivo | Na aula 3 |
|------|-----------|---------|-----------|
| Modelo | lê e grava as linhas de uma tabela | `app/models/produto.rb` | a lista de hashes e a classe `Produto` |
| View | é o HTML da página, com os buracos do ERB | `app/views/produtos/index.html.erb` | `aula3/views/produtos/index.html.erb` |
| Controller | busca os dados no modelo e entrega os dados para a view | `app/controllers/produtos_controller.rb` | o `result_with_hash(produtos: produtos)` |
| Rota | liga um endereço a uma ação do controller | `config/routes.rb` | abrir o arquivo `pagina.html` no navegador |

## Palavras de hoje

| Palavra | O que é |
|---------|---------|
| app | o programa Rails da feira, na pasta `aula4/feira` |
| banco de dados | o arquivo `storage/development.sqlite3`, que guarda as tabelas do app. O Rails lê e grava esse arquivo |
| migração | o arquivo com a receita de uma tabela: o nome e o tipo de cada coluna |
| seed | o arquivo `db/seeds.rb`, com as linhas que o `rails db:seed` grava nas tabelas |
| ação | um método do controller. Cada rota chama uma ação |
| layout | o começo e o fim do HTML, iguais em toda página: `app/views/layouts/application.html.erb` |
| servidor | o programa que o `rails server` inicia. Ele responde ao navegador |
| pedido | o que o navegador manda ao servidor quando você abre um endereço |
| console | o Ruby com o app carregado, que o `rails console` abre |

## Da aula 3 para o Rails

| Na aula 3 | No Rails |
|-----------|----------|
| `produtos = [{ nome: "alface", preco_em_centavos: 450 }, ...]` | o seed. O `rails db:seed` grava cada hash como uma linha da tabela |
| `class Produto` com `attr_reader` | `class Produto < ApplicationRecord`, sem `attr_reader` |
| `produtos.find { ... }` pelo id | `Produto.find_by(id: 2)` |
| `produtos.select { ... }` | `Produto.where(nome: "mel")` |
| `produtos.sort_by { ... }` | `Produto.order(:preco_em_centavos)` |
| `produtos.size` | `Produto.count` |
| `result_with_hash(produtos: produtos, teste: teste)` | `@produtos = Produto.all` no controller |
| `File.write` e abrir o `pagina.html` | `rails server` e abrir `http://localhost:3000/produtos` |
| o HTML inteiro na view | o começo e o fim do HTML no layout |

## Armadilhas de hoje

| Armadilha | O que acontece |
|-----------|----------------|
| rodar `rails ...` fora da pasta `feira` | o terminal mostra `Usage: rails new APP_PATH`, porque o comando não achou o app |
| esquecer o `rails db:migrate` | o navegador mostra uma página de erro, com `Migrations are pending` |
| variável sem `@` no controller | a view não recebe a variável. A página de erro mostra `undefined method 'each' for nil` |
| `Produto.find(99)` | o programa para com o erro `ActiveRecord::RecordNotFound`. O `Produto.find_by(id: 99)` devolve `nil` |
| dois `rails server` ao mesmo tempo | o segundo servidor mostra `A server is already running` e para |

## Passo 0: instalar o Rails e criar o app

1. Confira o Ruby e instale o Rails:
   ```
   ruby -v
   gem install rails --no-document
   rails -v
   ```
   O `ruby -v` mostra um texto que começa com `ruby 4.0`. O `rails -v` mostra
   `Rails 8.1.4` ou um número maior. O `--no-document` pula a documentação das
   gems. Num teste, a instalação levou 23 s sem a documentação e 31 s com a
   documentação.
2. Crie o app `feira` dentro da pasta `aula4`:
   ```
   cd aula4
   rails new feira --minimal
   cd feira
   ```
   O `rails new` cria a pasta `feira` com o app. O `--minimal` deixa de fora as
   peças que a aula não usa.
3. Inicie o servidor: `rails server`. O terminal fica ocupado com o servidor.
4. Abra `http://localhost:3000` no navegador. A página do Rails mostra
   `Rails version` e `Ruby version`.
5. Pare o servidor: aperte Ctrl+C no terminal do servidor.

Daqui em diante, rode todo comando `rails` dentro da pasta `aula4/feira`. Deixe
dois terminais abertos nessa pasta: um para o servidor e outro para os outros
comandos.

## Exemplo 01: o modelo e a tabela

1. Crie o modelo `Produto` e a tabela `produtos`:
   ```
   rails generate model Produto nome:string preco_em_centavos:integer
   rails db:migrate
   ```
   O `rails generate model` cria o modelo `app/models/produto.rb` e a migração
   em `db/migrate/`. Ele cria também 2 arquivos de teste, que a aula não usa.
   Na migração, a coluna `nome` é de texto (`string`), e a coluna
   `preco_em_centavos` é de número inteiro (`integer`). O Rails acrescenta as
   colunas `id`, `created_at` e `updated_at`. O `rails db:migrate` lê a
   migração e cria a tabela `produtos`, vazia.
2. Abra `app/models/produto.rb`. A classe está vazia e não tem `attr_reader`. O
   Rails lê as colunas da tabela e cria um método de leitura para cada coluna.
   O `<` é o `extends` do Java: `Produto` herda de `ApplicationRecord`.
3. Abra o seed, `db/seeds.rb`. Apague o texto que está lá e escreva a lista de
   hashes da aula 3:
   ```ruby
   # A lista de hashes da aula 3. O rails db:seed grava cada hash como uma linha da tabela produtos.
   produtos = [
     { nome: "alface",  preco_em_centavos: 450 },
     { nome: "tomate",  preco_em_centavos: 990 },
     { nome: "cenoura", preco_em_centavos: 620 },
     { nome: "mel",     preco_em_centavos: 2400 }
   ]

   produtos.each do |dados|
     Produto.find_or_create_by(dados)
   end
   ```
   O `find_or_create_by` procura na tabela uma linha igual ao hash. Se não acha
   a linha, o `find_or_create_by` cria a linha. Por isso, rodar o seed duas
   vezes não repete os produtos.
4. Grave as linhas na tabela: `rails db:seed`. Quando dá certo, o comando não
   mostra nada.
5. Leia `aula4/exemplos/01_modelo.rb` e escreva no papel o que cada linha
   mostra. Depois rode o exemplo: `rails runner ../exemplos/01_modelo.rb`.
   Compare a saída com o que você escreveu.
6. Abra o console: `rails console`. Digite `Produto.count` e
   `Produto.find_by(id: 2)`. Depois de cada busca, o console mostra o SQL que o
   Rails mandou ao banco de dados. Para sair, digite `exit`.

## Exemplo 02: a página

1. Crie o controller `ProdutosController`, com a ação `index`:
   ```
   rails generate controller Produtos index
   ```
   O comando cria o controller, a view `app/views/produtos/index.html.erb` e a
   rota `get "produtos/index"`.
2. Abra `config/routes.rb`. Troque a linha `get "produtos/index"` por esta
   linha:
   ```ruby
   get "/produtos", to: "produtos#index"
   ```
   Leia a rota assim: o endereço `/produtos` chama a ação `index` do
   `ProdutosController`.
3. Abra `app/controllers/produtos_controller.rb` e escreva a ação `index`:
   ```ruby
   class ProdutosController < ApplicationController
     def index
       @produtos = Produto.all
     end
   end
   ```
   O Rails entrega para a view toda variável do controller que começa com `@`.
   É o `result_with_hash` da aula 3.
4. Abra a view `app/views/produtos/index.html.erb` e troque o texto todo por:
   ```erb
   <h1>Produtos da feira</h1>
   <ul>
     <% @produtos.each do |produto| %>
       <li><%= produto.nome %>: R$ <%= format("%.2f", produto.preco_em_centavos / 100.0) %></li>
     <% end %>
   </ul>
   ```
   É a view da aula 3 com duas trocas: `produtos` vira `@produtos`, e
   `produto[:nome]` vira `produto.nome`. O `<head>` e o `<body>` ficam no
   layout.
5. No outro terminal, inicie o servidor: `rails server`. Abra
   `http://localhost:3000/produtos`. A página mostra os 4 produtos. O primeiro é
   `alface: R$ 4.50`.
6. Passe um dado novo para a view, como na aula 3:
   - No controller, embaixo de `@produtos = Produto.all`, escreva
     `@aviso = "Feira no sábado, das 7h às 12h"`.
   - Na view, embaixo do `<h1>`, escreva `<p><%= @aviso %></p>`.
   - Recarregue a página. A página mostra o aviso. O servidor lê o código novo
     sem reiniciar.
7. Leia o terminal do servidor. Cada pedido do navegador mostra as quatro peças
   e a resposta, nesta ordem:
   - a rota: `Started GET "/produtos"`
   - o controller: `Processing by ProdutosController#index`
   - o modelo: `Produto Load`
   - a view: `Rendered produtos/index.html.erb`
   - a resposta: `Completed 200 OK`

## Exercício 01: a página dos produtores

Crie a página `http://localhost:3000/produtores` no app `feira`. A página
mostra os 3 produtores da tabela do exercício 01 da aula 3.

1. O modelo `Produtor`, com as colunas `nome` e `cidade`. As duas colunas são
   de texto (`string`).
2. Os 3 produtores no fim do seed, no formato dos produtos: "Sítio Boa Terra"
   de Piracicaba, "Horta da Vila" de Campinas e "Roça do Zé" de Piracicaba.
3. O controller `ProdutoresController`, com a ação `index`.
4. A rota `get "/produtores", to: "produtores#index"`.
5. A view, com um `<li>` por produtor, no formato
   `<li>Sítio Boa Terra (Piracicaba)</li>`.
6. Extra: embaixo da primeira lista, uma segunda lista só com os produtores de
   Piracicaba. Use o `where`. Ele é o `select` do `nomes_da_cidade` da aula 3,
   executado pelo banco de dados.

Atenção: depois de criar o modelo, rode `rails db:migrate`. Depois de alterar o
seed, rode `rails db:seed`.

Atenção: o nome do controller é `Produtores`, no plural, como o endereço
`/produtores`.

Veja os exemplos 01 e 02 da aula.

Rode o verificador de dentro da pasta `aula4/feira`:

```
rails runner ../testes/01_produtores_teste.rb
```

O verificador mostra cada teste como `CERTO` ou `ERRADO`, como na aula 3. Ele
não precisa do servidor. Confira também a página no navegador:
`http://localhost:3000/produtores`.

## Tarefa para a aula 5: o olho que acha o erro da IA

Na aula 5, a IA escreve código para o app `feira`, e você julga o código. Para
treinar, julgue os casos 01, 03, 04, 05 e 06 da pasta `aula4/casos/`. Cada caso
tem 3 arquivos:

- o prompt que a IA recebeu: `README.md`
- a resposta da IA: `resposta_da_ia.rb`
- um teste: `teste.rb`

Antes de rodar o teste, escreva no papel:

1. O código está certo ou errado?
2. Se o código está errado, qual linha erra e o que acontece?
3. Qual resultado você espera?

Depois rode `ruby aula4/casos/NN_nome/teste.rb`. A tarefa é opcional. O caso 02
fica fora da tarefa, porque usa um assunto que a turma não viu em sala.

## Ordem da manhã

1. Passo 0: instale o Rails e crie o app `feira`.
2. Exemplo 01: crie o modelo, grave as linhas e rode o exemplo.
3. Exemplo 02: crie a rota, o controller e a view, e abra a página.
4. Exercício 01: crie a página dos produtores e rode o verificador.
