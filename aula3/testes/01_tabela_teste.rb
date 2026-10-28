require "minitest/autorun"
require_relative "../exercicios/01_tabela"

class TabelaTeste < Minitest::Test
  def produtores
    [
      { id: 1, nome: "Sítio Boa Terra", cidade: "Piracicaba" },
      { id: 2, nome: "Horta da Vila",   cidade: "Campinas" },
      { id: 5, nome: "Roça do Zé",      cidade: "Piracicaba" }
    ]
  end

  def test_buscar_por_id_acha_o_produtor
    assert_equal "Horta da Vila", buscar_por_id(produtores, 2)[:nome]
  end

  def test_buscar_por_id_nao_e_a_posicao
    achado = buscar_por_id(produtores, 5)
    refute_nil achado, "o id não é a posição: procure pelo id (find), como no exemplo 01"
    assert_equal "Roça do Zé", achado[:nome], "o id não é a posição: procure pelo id (find), como no exemplo 01"
  end

  def test_buscar_por_id_que_nao_existe_devolve_nil
    assert_nil buscar_por_id(produtores, 99)
  end

  def test_nomes_da_cidade
    assert_equal ["Sítio Boa Terra", "Roça do Zé"], nomes_da_cidade(produtores, "Piracicaba")
  end

  def test_cidade_sem_ninguem_devolve_lista_vazia
    assert_equal [], nomes_da_cidade(produtores, "Santos")
  end
end
