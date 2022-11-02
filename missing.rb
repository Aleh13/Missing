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

magazine11 = YAML.safe_load_file('magazine11.yml', symbolize_names: true)
magazine10 = YAML.safe_load_file('magazine10.yml', symbolize_names: true)
magazine9 = YAML.safe_load_file('magazine9.yml', symbolize_names: true)

puts 'Классы:'

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

loop do
puts
puts
puts 'Выберите класс'
kl = gets.strip

if kl == '9а'
  l = 0
elsif kl == '9б'
  l = 1
elsif kl == '9в'
  l = 2
end

magazine9.each do |x|
  classy9 = "#{x[:pupils][l]}"
  puts classy9
end
end