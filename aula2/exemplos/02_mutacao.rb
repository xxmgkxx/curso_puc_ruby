# Rode com:  ruby aula2/exemplos/02_mutacao.rb
#
# Alguns métodos DEVOLVEM um valor novo. Outros MUDAM o objeto original.
# Por convenção, os que mudam terminam com ! (mas nem todos avisam).

nome = "sítio boa terra"

# Sem !: devolve outro texto, o original continua igual.
maiusculo = nome.upcase
puts maiusculo   # SÍTIO BOA TERRA
puts nome        # sítio boa terra  (não mudou)

# Com !: muda o original.
nome.upcase!
puts nome        # SÍTIO BOA TERRA  (mudou)

# ARMADILHA: << muda a lista original, mesmo sem !
lista_a = ["alface"]
lista_b = lista_a          # NÃO é uma cópia: é o mesmo objeto, com dois nomes
lista_b << "tomate"
p lista_a                  # ["alface", "tomate"]  <- mudou também!

# Para ter uma cópia de verdade:
lista_c = lista_a.dup
lista_c << "cenoura"
p lista_a                  # inalterada
p lista_c

# ARMADILHA CLÁSSICA: Hash.new([]) parece dar uma lista por chave, mas dá
# a MESMA lista para todo mundo.
errado = Hash.new([])
errado[:frutas] << "laranja"
errado[:verduras] << "alface"
p errado[:frutas]    # ["laranja", "alface"]  <- misturou tudo
p errado             # {} <- e o hash está VAZIO: nada foi guardado de verdade

# O jeito certo: um bloco que cria uma lista nova por chave.
certo = Hash.new { |hash, chave| hash[chave] = [] }
certo[:frutas] << "laranja"
certo[:verduras] << "alface"
p certo              # {frutas: ["laranja"], verduras: ["alface"]}
