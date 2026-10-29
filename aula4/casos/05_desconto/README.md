# Caso 5: total com desconto

## O prompt que a IA recebeu

> Os preços dos produtos estão em reais. Escreva
> `total_com_desconto(precos, desconto_em_porcentagem)` que aplica o
> desconto e devolve o total a pagar.

## A resposta da IA

A resposta está em `resposta_da_ia.rb`. O raciocínio está certo: multiplicar,
subtrair e somar. O código não tem erro de lógica.

## Sua vez, ANTES de rodar

A cliente levou dois produtos: R$ 2,30 e R$ 4,70. Total R$ 7,00, com 10% de
desconto.

1. Quanto a cliente paga? Use a calculadora.
2. Quanto dá `0.1 + 0.2` em Ruby? Revise o exemplo 02 da aula 1.
3. O que esse método devolve? É **exatamente** o mesmo número?

Este caso é diferente dos outros: o erro é minúsculo, na décima quinta casa
decimal. As perguntas que importam são:

- Onde um erro desse tamanho vira problema de verdade?
- O que acontece quando o programa soma esse número mil vezes?
- O que acontece quando o programa compara esse número com `==`?
- O que acontece quando o programa manda esse número para um relatório financeiro?

Depois rode: `ruby aula4/casos/05_desconto/teste.rb`
