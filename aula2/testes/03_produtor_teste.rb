require "minitest/autorun"
require_relative "../exercicios/03_produtor"

class ProdutorTeste < Minitest::Test
  def setup
    @produtor = Produtor.new("Sítio Boa Terra", "Piracicaba")
  end

  def test_le_nome_e_cidade
    assert_equal "Sítio Boa Terra", @produtor.nome
    assert_equal "Piracicaba", @produtor.cidade
  end

  def test_comeca_sem_produtos
    assert_equal [], @produtor.produtos
    assert_equal 0.0, @produtor.total_em_reais
  end

  def test_adiciona_produtos_e_soma
    @produtor.adicionar_produto("alface", 450)
    @produtor.adicionar_produto("tomate", 990)

    assert_equal 2, @produtor.produtos.size
    assert_equal "alface", @produtor.produtos.first[:nome]
    assert_in_delta 14.40, @produtor.total_em_reais, 0.001
  end

  def test_to_s
    assert_equal "Sítio Boa Terra (Piracicaba)", @produtor.to_s
  end

  def test_produtores_nao_compartilham_a_mesma_lista
    outro = Produtor.new("Horta da Vila", "Campinas")
    @produtor.adicionar_produto("alface", 450)

    assert_equal 0, outro.produtos.size, "os dois produtores estão dividindo a mesma lista"
  end
end
