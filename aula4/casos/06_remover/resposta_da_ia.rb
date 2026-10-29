# Remove os produtos inativos da lista.
#
# @param produtos [Array<Hash>] produtos com :nome e :ativo
# @return [Array<Hash>] a lista sem os produtos inativos
def remover_inativos(produtos)
  produtos.each do |produto|
    produtos.delete(produto) unless produto[:ativo]
  end

  produtos
end
