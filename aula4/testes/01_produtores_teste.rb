# Rode com:  rails runner ../testes/01_produtores_teste.rb
# (de dentro da pasta aula4/feira)
unless defined?(Rails)
  abort "Este verificador roda dentro do app Rails. Entre na pasta aula4/feira e rode: rails runner ../testes/01_produtores_teste.rb"
end
require_relative "../../bin/certo_ou_errado"

class ProdutoresTeste < Minitest::Test
  # Abre a página /produtores como o navegador, sem o rails server.
  def pagina
    navegador = ActionDispatch::Integration::Session.new(Rails.application)
    navegador.host! "localhost"
    navegador.get "/produtores"
    navegador.response
  end

  # O texto de cada <li> da página.
  def itens_da_lista
    pagina.parsed_body.css("li").map { |item| item.text.squish }
  end

  def test_a_tabela_tem_os_3_produtores
    assert_equal 3, Produtor.count, "rode o rails db:seed. Se a tabela tem mais de 3 produtores, pare o servidor e rode o rails db:reset"
  end

  def test_a_pagina_abre
    assert_equal 200, pagina.status, "confira a rota do /produtores em config/routes.rb"
  end

  def test_a_pagina_mostra_nome_e_cidade
    assert_includes itens_da_lista, "Sítio Boa Terra (Piracicaba)"
    assert_includes itens_da_lista, "Roça do Zé (Piracicaba)"
  end
end
