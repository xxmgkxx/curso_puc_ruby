# Aula 2: ler código que você não escreveu

Escrever código é metade do trabalho. A outra metade, a que mais importa neste
curso, é **ler o código de outra pessoa e julgar se está certo**. A partir da
aula 4 essa outra pessoa vai ser a IA.

## O que você vai aprender

- blocos e o que cada iterador devolve: `each`, `map`, `select`, `reject`
- somar, contar, ordenar e agrupar: `sum`, `count`, `max_by`, `sort_by`, `group_by`
- o atalho `&:metodo`
- mutação: a diferença entre devolver um valor novo e mudar o original
- classes e objetos: `initialize`, `attr_reader`, métodos de instância
- o protocolo de leitura de um método desconhecido

## O protocolo (decore, é a ferramenta central do curso)

Diante de um método que você não escreveu, pergunte, nesta ordem:

1. **O que entra?** Tipos e formato dos argumentos.
2. **O que sai?** A última linha do método é o retorno.
3. **O que ele muda por fora?** Mutação de lista, escrita em arquivo, banco.
4. **Que caso de borda ele não trata?** Lista vazia, `nil`, zero, texto inválido.

A pergunta 4 é a que pega quase todo erro de IA.

## Armadilhas de hoje

| Armadilha | O que acontece |
|-----------|----------------|
| `each` no lugar de `map` | devolve a lista original, sem a transformação |
| `lista_b = lista_a` | não é cópia: são dois nomes para a mesma lista |
| `Hash.new([])` | todas as chaves dividem a MESMA lista, e o hash fica vazio |
| `sum` e `size` em lista vazia | `0.fdiv(0)` dá `NaN` |

## Ordem da manhã

1. Rode e leia os exemplos:
   ```
   ruby aula2/exemplos/01_blocos.rb
   ruby aula2/exemplos/02_mutacao.rb
   ruby aula2/exemplos/03_objetos.rb
   ruby aula2/exemplos/04_lendo_codigo_alheio.rb
   ```
2. Resolva `aula2/exercicios/`.
3. Verifique: `ruby bin/verificar aula2`
