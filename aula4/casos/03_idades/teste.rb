require_relative "../../../bin/certo_ou_errado"
require_relative "resposta_da_ia"

class MediaDeIdadeTeste < Minitest::Test
  def test_todas_as_idades_preenchidas
    assert_in_delta 42.0, media_de_idade(["42", "35", "49"]), 0.0001
  end

  def test_ignora_quem_nao_informou
    # 42, 35 e 51 preenchidos: a média deve ser dos TRÊS que existem, 42.6666
    assert_in_delta 42.6667, media_de_idade(["42", "35", "não informado", "51"]), 0.0001
  end
end
