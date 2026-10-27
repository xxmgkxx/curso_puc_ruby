require "minitest/autorun"
require_relative "../exercicios/01_relatorio"

class RelatorioTeste < Minitest::Test
  def vendas
    [
      { produtor: "Horta da Vila",   produto: "cenoura", valor_em_centavos: 1200 },
      { produtor: "Sítio Boa Terra", produto: "alface",  valor_em_centavos: 800 },
      { produtor: "Horta da Vila",   produto: "cenoura", valor_em_centavos: 450 }
    ]
  end

  def test_produtos_sem_repetir
    assert_equal ["cenoura", "alface"], produtos_vendidos(vendas)
  end

  def test_total_do_produtor
    assert_equal 1650, total_do_produtor(vendas, "Horta da Vila")
    assert_equal 800,  total_do_produtor(vendas, "Sítio Boa Terra")
  end

  def test_total_do_produtor_desconhecido
    assert_equal 0, total_do_produtor(vendas, "Roça do Zé")
  end

  def test_total_por_produtor
    esperado = { "Horta da Vila" => 1650, "Sítio Boa Terra" => 800 }
    assert_equal esperado, total_por_produtor(vendas)
  end

  def test_ticket_medio
    assert_in_delta 8.1666, ticket_medio_em_reais(vendas), 0.001
  end

  def test_ticket_medio_de_lista_vazia_e_zero
    assert_equal 0.0, ticket_medio_em_reais([])
  end
end
