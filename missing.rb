require 'yaml'

# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

# Считываем информацию с файла yaml, symbolize_names: true - ключ делаем сиволом
magazine11 = YAML.safe_load_file('magazine11.yml', symbolize_names: true)
magazine10 = YAML.safe_load_file('magazine10.yml', symbolize_names: true)
magazine9 = YAML.safe_load_file('magazine9.yml', symbolize_names: true)



puts 'Классы:'

# Вывод ученических классов на экран
magazine11.each do |x|
  classy11 = "#{x[:Classy]} "
  print classy11
end

puts
magazine10.each do |x|
  classy10 = "#{x[:Classy]} "
  print classy10
end

puts
magazine9.each do |x|
  classy9 = "#{x[:Classy]} "
  print classy9
end


puts
puts

# Выбор ученического класса
mag9a = []
mag9a << magazine9[0]

mag9b = []
mag9b << magazine9[1]

mag9v = []
mag9v << magazine9[2]


puts 'Выберите класс:'
kl = gets.strip

if kl == '9а'
  l = mag9a
elsif kl == '9б'
  l = mag9b
elsif kl == '9в'
  l = mag9v
end


l.each do |classy|
classy[:pupils].each_with_index do |x, i|
  classy9 = x
  puts "#{i+1}-#{classy9}"
end


prichina = ['болеет', 'справка','в лагере']

puts
loop do
puts 'Выберите ученика:'
uch = gets.strip.to_i
  
l.each do |i|
  uchenic9 = "#{i[:pupils][uch - 1]}"
  puts uchenic9
  puts '1 - болеет, 2 - справка, 3 - в лагере'
  pr = gets.to_i
  puts "#{uchenic9}-#{prichina[pr - 1]}"


end
end
end


