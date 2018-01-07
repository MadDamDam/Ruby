require 'open-uri'

f=open("http://www.google.com") #{|f| f.each_line {|line| puts line}}
begin
  f.each_line {|line| puts line}  #...process
rescue
  puts "Error happened" #...handle error
ensure
  f.close
end


begin
  f=open("http://fdasgkjhka.fdsf")
  f.each_line {|line| puts line}  #...process
rescue
  puts "Error happened" #...handle error
ensure
  f.close
end
