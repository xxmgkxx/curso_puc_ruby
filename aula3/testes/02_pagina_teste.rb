require_relative "../../bin/certo_ou_errado"
require_relative "../exercicios/02_pagina"

class PaginaTeste < Minitest::Test
  # A parte 2 monta os objetos com Produtor.new, então depende só do
  # initialize e do attr_reader da parte 1.
  def produtores
    [Produtor.new(1, "Sítio Boa Terra", "Piracicaba"),
     Produtor.new(2, "Horta da Vila", "Campinas")]
  end

  def test_produtor_guarda_os_valores
    produtor = Produtor.new(1, "Sítio Boa Terra", "Piracicaba")
    assert_respond_to produtor, :nome, "faltou o attr_reader: sem ele não dá para ler produtor.nome (exemplo 02)"
    assert_equal 1, produtor.id
    assert_equal "Sítio Boa Terra", produtor.nome
    assert_equal "Piracicaba", produtor.cidade
  end

  def test_to_s
    assert_equal "Sítio Boa Terra (Piracicaba)", Produtor.new(1, "Sítio Boa Terra", "Piracicaba").to_s
  end

  def test_all_devolve_tres_produtores
    assert_equal 3, Produtor.all.size
    assert_kind_of Produtor, Produtor.all.first
  end

  def test_all_tem_os_produtores_da_feira
    nomes = Produtor.all.map { |produtor| produtor.nome }
    assert_equal ["Sítio Boa Terra", "Horta da Vila", "Roça do Zé"], nomes
  end

  def test_pagina_tem_a_lista
    html = pagina_de_produtores(produtores)
    assert_includes html, "<ul>"
    assert_includes html, "</ul>"
  end

  def test_pagina_tem_um_li_por_produtor
    html = pagina_de_produtores(produtores)
    assert_includes html, "<li>Sítio Boa Terra (Piracicaba)</li>"
    assert_includes html, "<li>Horta da Vila (Campinas)</li>"
    assert_equal 2, html.scan("<li>").size
  end

  def test_pagina_com_tres_produtores_tem_tres_li
    assert_equal 3, pagina_de_produtores(Produtor.all).scan("<li>").size
  end
end
