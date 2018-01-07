# Strings to Symbols
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []
strings.each { |string| symbols.push(string.intern)}

#Add to Hash
pets = Hash.new
pets["Slice"] = "cat"
puts pets["Slice"]

#case
case language
  when "JS"
    puts "Websites!"
  when "Python"
    puts "Science!"
  when "Ruby"
    puts "Web apps!"
  else
    puts "I don't know!"
end

#get input
choice = gets.chomp

#movies
movies = Hash.new
movies[:Logan] = 4
movies[:Blade_Runner] = 3
puts movies

puts "Welcome to movie ratings system."
puts "available actions are 'add', 'update', 'display', or 'delete'."
print "Please enter your choise: "
choice = gets.chomp

case choice
	when "add"
  	print "Please enter title of movie to add: "
  	title = gets.chomp

  	if !movies[title.to_sym] then
  		print "Please enter rating of movie: "
  	  rating = gets.chomp
      movies[title.to_sym] = rating.to_i
  		puts "Movie added!"
    else
      puts "Movie already exists. Nothing added."
    end

  when "update"
  	print "Please enter title of movie to update: "
  	title = gets.chomp

    if movies[title.to_sym] then
  		print "Please enter rating of movie: "
  	  rating = gets.chomp
      movies[title.to_sym] = rating.to_i
  		puts "Movie updated!"
    else
      puts "Movie doesn't exists. Nothing updated."
    end

  when "display"
  	puts "Movie ratings:"
    movies.each { |k, v| puts "#{k}: #{v}"}

  when "delete"
		print "Please enter title of movie to delete: "
    title = gets.chomp

    if movies[title.to_sym] then
      movies.delete(title.to_sym)
  		puts "Movie deleted!"
    else
      puts "Movie doesn't exists. Nothing deleted."
    end

  else
  	puts "Error!"
end

puts movies

#Ternary
puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."

#conditional assignment
favorite_book ||= "Cat's Cradle"

#check even
my_array.each { |x| puts x if x.even?}
#upto downto
95.upto(100) { |num| print num, " " }
"L".upto("P") { |x| puts x}
#respond_to?, next
age.respond_to?(:next)
#push into array
alphabet.push("d")
alphabet << "d"

#variable type manipulation
x.to_s
x.to_sym   or  #{x}
x.to_i
x.to_a  #to array

#times
10.times do
  puts "Knock knock."
  puts "Who's there?"
end

#Check variable type
n.is_a? Integer
prime_array.nil?

#prime
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)
  return "n must be an integer." unless n.is_a? Integer
  return "n must be greater than 0." if n <= 0
  Prime.first n
end

first_n_primes(10)

#Collect - apply expression to array and return array
my_nums.collect { |num| num ** 2 }
#same as map

#select - return array for which block expression is True
print (1..100).to_a.select(&multiples_of_3)

#proc
cube = Proc.new { |x| x ** 3 }
[1, 2, 3].collect!(&cube)
cube.call

#floor - rounds a float down to the nearest integer

#turn symbol or method to Proc:
numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.map(&:to_s)

#lambda
lambda { |param| block }

#Class
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description

#Class Variables
class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}

  def initialize(username, password)
    @username = username
    @password = password
  end

  def current_user
    @username
  end

  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

#inheritance
class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

#Call super method
class DerivedClass < Base
  def some_method
    super(optional args)
      # Some stuff
    end
  end
end

#Class 2
class Machine
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end

 #Class method - prefixed by class name
  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"

#Private and public methods
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  public    # This method can be called from outside the class.

  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end

  private   # This method can't!

  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new("Eric", 26)
eric.about_me
eric.bank_account_number

#attr_reader and attr_writer
attr_reader :name
attr_writer :job

#attr_accessor is both
attr_accessor :name

#module
module Circle

  PI = 3.141592653589793

  def Circle.area(radius)
    PI * radius**2
  end

  def Circle.circumference(radius)
    2 * PI * radius
  end
end

#require to use module
require 'date'

#include to use methods of module (creates mixin)
include Math

#extend to include module methods at the class level
extend ThePresent

#random
rand(4)
