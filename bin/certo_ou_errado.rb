# Mostra o resultado dos testes em português: CERTO ou ERRADO, um teste por linha,
# na ordem do arquivo. Os testes da aula 3 em diante começam com:
#   require_relative "../../bin/certo_ou_errado"
require "minitest/autorun"

module Minitest
  # As mensagens de falha no formato "Esperado / Veio".
  module Assertions
    def diff(esperado, obtido)
      "Esperado: #{esperado.inspect}\n    Veio: #{obtido.inspect}"
    end

    def assert_nil(obtido, msg = nil)
      assert obtido.nil?, message(msg, "") { diff(nil, obtido) }
    end

    def refute_nil(obtido, msg = nil)
      assert !obtido.nil?, message(msg, "") { "Esperado: um valor, e não nil\n    Veio: nil" }
    end

    def refute_empty(obtido, msg = nil)
      assert !obtido.empty?, message(msg, "") { "Esperado: algo que não esteja vazio\n    Veio: #{obtido.inspect}" }
    end

    def assert_in_delta(esperado, obtido, folga = 0.001, msg = nil)
      perto = obtido.is_a?(Numeric) && (esperado - obtido).abs <= folga
      assert perto, message(msg, "") { "Esperado: #{esperado.inspect} (mais ou menos #{folga})\n    Veio: #{obtido.inspect}" }
    end

    def assert_includes(colecao, item, msg = nil)
      contem = colecao.respond_to?(:include?) && colecao.include?(item)
      assert contem, message(msg, "") { "Esperado: algo que contenha #{item.inspect}\n    Veio: #{colecao.inspect}" }
    end

    def assert_kind_of(classe, obtido, msg = nil)
      assert obtido.kind_of?(classe), message(msg, "") { "Esperado: um #{classe}\n    Veio: #{obtido.inspect}" }
    end

    def assert_respond_to(objeto, metodo, msg = nil, include_all: false)
      assert objeto.respond_to?(metodo, include_all), message(msg, "") { "Esperado: um objeto com o método #{metodo}\n    Veio: #{objeto.inspect}" }
    end
  end

  class CertoOuErrado < AbstractReporter
    PASTA = "#{Dir.pwd}/"

    def initialize
      super
      @resultados = []
      @ultima = ""
    end

    # Imprime a linha, mas nunca duas linhas em branco seguidas.
    def linha(texto = "")
      puts texto unless texto == "" && @ultima == ""
      @ultima = texto
    end

    def record(resultado)
      @resultados << resultado
    end

    def passed?
      @resultados.all?(&:passed?)
    end

    def report
      @resultados.group_by { |r| File.expand_path(r.source_location[0]) }.sort.each do |arquivo, resultados|
        linha
        linha "#{arquivo.delete_prefix(PASTA)} (certos: #{resultados.count(&:passed?)} de #{resultados.size})"
        linha
        resultados.sort_by { |r| r.source_location[1] }.each { |r| mostra(r) }
      end

      certos = @resultados.count(&:passed?)
      linha
      if certos == @resultados.size
        linha "Certos: #{certos} de #{certos}. Tudo certo!"
      else
        linha "Certos: #{certos} de #{@resultados.size}. Errados: #{@resultados.size - certos}."
      end
    end

    # O nome do teste sai como está no arquivo, sem o "test_".
    def mostra(resultado)
      nome = resultado.name.delete_prefix("test_")
      if resultado.passed?
        linha "  CERTO   #{nome}"
      else
        linha
        linha "  ERRADO  #{nome}"
        explica(resultado.failure).each_line { |texto| linha "          #{texto.chomp}" }
        linha
      end
    end

    # O que deu errado e em que linha. A linha é a primeira do curso,
    # fora deste arquivo: o teste que falhou ou o código que quebrou.
    def explica(falha)
      if falha.is_a?(UnexpectedError)
        texto = "O código parou com um erro: #{falha.error.message} (#{falha.error.class})"
        locais = falha.error.backtrace_locations
      else
        texto = falha.message
        locais = falha.backtrace_locations
      end
      local = (locais || []).find { |l| l.absolute_path.to_s.start_with?(PASTA) && l.absolute_path != __FILE__ }
      if local
        "#{texto}\nLinha: #{local.absolute_path.delete_prefix(PASTA)}:#{local.lineno}"
      else
        texto
      end
    end
  end

  def self.plugin_certo_ou_errado_init(_opcoes)
    reporter.reporters.replace([CertoOuErrado.new])
  end

  extensions << "certo_ou_errado"
end
