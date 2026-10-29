# Caso 2: agrupar produtos por categoria

## O prompt que a IA recebeu

> Escreva `agrupar_por_categoria(produtos)` que recebe uma lista de hashes
> com `:nome` e `:categoria` e devolve um hash com a categoria como chave e
> a lista de nomes como valor.

## A resposta da IA

A resposta está em `resposta_da_ia.rb`. Repare: a IA usou `Hash.new([])` para
"já começar com uma lista vazia". A ideia parece esperta.

## Sua vez, ANTES de rodar

1. O que esse método devolve para a lista de exemplo?
2. Escreva a sua resposta no papel. Preste atenção no `<<`.

Depois rode: `ruby aula4/casos/02_agrupar/teste.rb`
