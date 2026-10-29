require_relative "../../../bin/certo_ou_errado"
require_relative "resposta_da_ia"

class NomesEmMaiusculasTeste < Minitest::Test
  def test_devolve_os_nomes_em_maiusculas
    assert_equal ["MARTA", "ANTÔNIO"], nomes_em_maiusculas(["Marta", "Antônio"])
  end

  def test_nao_altera_a_lista_original
    original = ["Marta"]
    nomes_em_maiusculas(original)
    assert_equal ["Marta"], original
  end
end
