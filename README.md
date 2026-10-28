# Ruby e IA: entender antes de aceitar

Minicurso de cinco manhãs, para alunos de graduação em Computação, incluindo
quem nunca escreveu uma linha de Ruby. Aqui está o material das **aulas 1 a 3**.

> **A IA não faz nada melhor do que você seria capaz de criar. Ela amplia a sua
> capacidade, não substitui.**

Por isso a ordem é: primeiro Ruby, depois IA. Nas primeiras aulas, sem IA.

## Como rodar

Você precisa só do Ruby 3.4 ou mais novo (recomendado: 4.0). Nada de gems.

- **Windows:** baixe o "Ruby+Devkit 4.0.X (x64)" em rubyinstaller.org/downloads
  (notebook ARM: a versão arm), ou rode
  `winget install RubyInstallerTeam.RubyWithDevKit.4.0`.
- **macOS:** o Ruby que vem no Mac (2.6) não serve. Rode `brew install ruby` e
  abra um terminal novo.
- **Linux:** prefira `rbenv` ou `mise`; o do `apt` pode ser antigo.

```
ruby -v                       # confira que tem Ruby 3.4.x ou 4.0.x
ruby aula1/exemplos/01_primeiros_passos.rb
ruby bin/verificar aula1      # roda os testes da aula
ruby bin/verificar aula1 02   # roda só o exercício 02
```

## Como estudar

1. Leia o README da aula: [aula 1](aula1/README.md), [aula 2](aula2/README.md), [aula 3](aula3/README.md).
2. Rode os exemplos e **leia a saída** antes de seguir.
3. Resolva os exercícios.
4. Rode a verificação e leia as falhas: a mensagem diz o que era esperado.

Use o `irb` para tirar dúvida na hora: digite `irb` e teste `7 / 2`.

**A regra do laboratório:** nenhuma linha entra sem que você saiba explicar o
que ela faz.
