require_relative "../../../bin/certo_ou_errado"
require_relative "resposta_da_ia"

class MediaDasNotasTeste < Minitest::Test
  def test_media_de_numeros_redondos
    assert_in_delta 8.0, media_das_notas([6, 8, 10]), 0.0001
  end

  def test_media_com_resultado_quebrado
    assert_in_delta 8.3333, media_das_notas([7, 8, 10]), 0.0001
  end

  def test_media_de_duas_notas
    assert_in_delta 4.5, media_das_notas([7, 2]), 0.0001
  end
end
