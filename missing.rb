# encoding: utf-8
require 'yaml'
require 'pony'

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

kl = nil

loop do
puts 'Выберите класс:'
kl = gets.strip

if kl.between?('9а', '9в')
    break
else
  puts 'Ответ только 9а - 9в'
end
end

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

uchmass = []
massu = []
prichina = ["болеет\n", "справка\n","в лагере\n"]


puts
uch = nil

loop do
loop do

puts '____________________________________________'
puts 'Выберите ученика или Exit (0)'

uch = gets.strip.to_i
if uch.between?(0, 3)
    break
else
  puts 'Ответ только 1 - 3'
end
end

if uch == 0
  massu.each do |i|
    puts i
end

my_mail = 'sch4@minsk.edu.by'
password = 'Sch4qwer2022'
send_to = 'q4wk13@gmail.com'

body = massu


Pony.mail(
  charset: 'UTF-8',
  subject: "Отсутствующие #{kl} класс", # тема письма
  body: body, # текст письма, его тело
  to: send_to, # кому отправить письмо
  from: my_mail, # от кого письмо (наш обратный адрес)


 via: :smtp,
 via_options: {
   address: 'smtp.yandex.ru',
   port: '465',
   enable_starttls_auto: true,
   tls: true,
   user_name: my_mail,
   password: password,
   authentication: :plain,
 }
)

puts
puts 'Сведения переданы!'

    exit   
end


pr = nil

l.each do |i|
  uchenic9 = "#{i[:pupils][uch - 1]}"
  puts uchenic9


if uchmass.include?(uchenic9)
  puts 'Выберите другого ученика, этот ученик отмечен'
  break
end


loop do
  puts '1 - болеет, 2 - справка, 3 - в лагере,'
  pr = gets.to_i

  if pr.between?(1, 3)
    break
  else
  puts 'Ответ только 1 - 3'
  end
  end

  u = "#{uchenic9}-#{prichina[pr - 1]}"
  puts u
  massu << u
  
  uchmass << uchenic9



end
end
end

