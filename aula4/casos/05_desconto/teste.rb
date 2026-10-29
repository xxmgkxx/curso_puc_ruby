require_relative "../../../bin/certo_ou_errado"
require_relative "resposta_da_ia"

class TotalComDescontoTeste < Minitest::Test
  def test_total_sem_desconto
    assert_equal 7.0, total_com_desconto([2.30, 4.70], 0)
  end

  def test_total_com_dez_por_cento
    # R$ 7,00 com 10% de desconto dá exatamente R$ 6,30
    assert_equal 6.30, total_com_desconto([2.30, 4.70], 10)
  end
end
