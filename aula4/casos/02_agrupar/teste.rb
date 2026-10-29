require_relative "../../../bin/certo_ou_errado"
require_relative "resposta_da_ia"

class AgruparPorCategoriaTeste < Minitest::Test
  def produtos
    [
      { nome: "alface",  categoria: "verdura" },
      { nome: "cenoura", categoria: "legume" },
      { nome: "rúcula",  categoria: "verdura" }
    ]
  end

  def test_agrupa_corretamente
    esperado = { "verdura" => ["alface", "rúcula"], "legume" => ["cenoura"] }
    assert_equal esperado, agrupar_por_categoria(produtos)
  end

  def test_o_hash_nao_pode_voltar_vazio
    refute_empty agrupar_por_categoria(produtos)
  end
end
