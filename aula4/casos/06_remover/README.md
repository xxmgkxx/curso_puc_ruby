# Caso 6: remover os produtos inativos

## O prompt que a IA recebeu

> Escreva `remover_inativos(produtos)` que recebe a lista de produtos
> (hashes com `:nome` e `:ativo`) e remove da lista os que estão inativos.

## A resposta da IA

A resposta está em `resposta_da_ia.rb`.

## Sua vez, ANTES de rodar

A lista de teste tem DOIS inativos seguidos:

```
alface (ativo), tomate (inativo), cenoura (inativo), mel (ativo)
```

1. Percorra o `each` na mão, item por item. Anote o índice atual e a lista
   depois de cada remoção.
2. Quantos itens sobram? Quais?

Este é o erro mais traiçoeiro dos casos: com UM inativo só, o método devolve a
lista certa. O método só erra com dois inativos seguidos, um caso que quase
ninguém testa.

Depois rode: `ruby aula4/casos/06_remover/teste.rb`
