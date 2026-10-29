# Agrupa os produtos por categoria.
#
# @param produtos [Array<Hash>] produtos com :nome e :categoria
# @return [Hash] categoria => lista de nomes
def agrupar_por_categoria(produtos)
  resultado = Hash.new([])

  produtos.each do |produto|
    resultado[produto[:categoria]] << produto[:nome]
  end

  resultado
end
