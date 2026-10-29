# Calcula a média de idade dos produtores.
#
# @param idades [Array<String>] idades preenchidas no formulário
# @return [Float] a média das idades
def media_de_idade(idades)
  return 0.0 if idades.empty?

  idades.map(&:to_i).sum.fdiv(idades.size)
end
