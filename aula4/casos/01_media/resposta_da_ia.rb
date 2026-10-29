# Calcula a média aritmética de uma lista de notas.
#
# @param notas [Array<Integer>] as notas dos alunos
# @return [Numeric] a média das notas
def media_das_notas(notas)
  return 0 if notas.empty?

  soma = notas.sum
  soma / notas.size
end
