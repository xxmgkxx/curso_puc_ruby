require_relative "../../../bin/certo_ou_errado"
require_relative "resposta_da_ia"

class RemoverInativosTeste < Minitest::Test
  def test_um_inativo_isolado
    produtos = [
      { nome: "alface", ativo: true },
      { nome: "tomate", ativo: false },
      { nome: "mel",    ativo: true }
    ]

    assert_equal ["alface", "mel"], remover_inativos(produtos).map { |p| p[:nome] }
  end

  def test_dois_inativos_seguidos
    produtos = [
      { nome: "alface",  ativo: true },
      { nome: "tomate",  ativo: false },
      { nome: "cenoura", ativo: false },
      { nome: "mel",     ativo: true }
    ]

    assert_equal ["alface", "mel"], remover_inativos(produtos).map { |p| p[:nome] }
  end
end
