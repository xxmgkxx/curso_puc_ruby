require "minitest/autorun"
require_relative "../exercicios/02_agrupamento"

class AgrupamentoTeste < Minitest::Test
  def produtos
    [
      { nome: "alface",  categoria: "verdura" },
      { nome: "cenoura", categoria: "legume" },
      { nome: "rúcula",  categoria: "verdura" },
      { nome: "mel",     categoria: "outros" }
    ]
  end

  def test_agrupa_por_categoria
    esperado = {
      "verdura" => ["alface", "rúcula"],
      "legume"  => ["cenoura"],
      "outros"  => ["mel"]
    }
    assert_equal esperado, agrupar_por_categoria(produtos)
  end

  def test_lista_vazia
    assert_equal({}, agrupar_por_categoria([]))
  end

  def test_o_hash_realmente_guarda_os_dados
    resultado = agrupar_por_categoria(produtos)
    refute_empty resultado, "o hash voltou vazio: provavelmente é a armadilha do Hash.new([])"
    assert_equal 3, resultado.keys.size
  end
end
