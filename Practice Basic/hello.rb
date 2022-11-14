# Print a statement
puts "Hello world"
print "hello world"   
print "this is second statement"

# take input from user
puts;
print ("Please enter number: ")
# number = gets.chomp
# puts "Enterd number is #{number}"

# Ruby operators 
# 1.) Unery Operators
#     !, ~, +
# 2.) Arithmetic Operators
#     +, -, /, *, %, **
# 3.) Bitwise Operators
#     &, |, <<, >>, ^, ~
# 4.) Logical Operators
#     &&, ||
# 5.) Ternary Operators
#     ?, : 
# 6.) Assignment Operators
#     =, +=, -=, *=, /=, %=, **=
# 7.) Comparision Operators
#     ==, !=, <, >, <=, >=, <=>, .eql (checks for equality and type of the operands), equal?(checks for object ID)
# 8.) Range Operators
#     ..(inclusive of the last terams), ...(exclusive of the last terams)
puts "Unery Operator"
puts(!true)
puts(~2) 
puts(-2)
puts(~-2) #return  2's complement

puts "Arithmetic Operators"
puts(3+2)
puts(3-2)
puts(3*2)
puts(3/2)
puts(3**2)

puts " Bitwise Operators"
puts(3&2) # 0011 & 0010 -> 0010
puts(3|2) # 0011 | 0010 -> 0011
puts(3<<2) # 0011 -> 1100 -> 8+4 = 12
puts(3>>2) # 0011 -> 0000 -> 0
puts(3^2) # 0011 ^ 0010 -> 0001
puts(~3) # 0011 -> 1100-> 1100 - 1->  1011-> 0100-> 4

puts "Logical Operators"
puts(3&&2)
puts(3||2)

puts "Ternary Operators"
puts(5>2 ? 5 : 2)

puts "Comparision Operators"
puts(2 == 2)
puts(2 != 3)
puts(2 < 3)
puts(2 > 3)
puts(2 <= 3)
puts(2 >= 3)
puts(2 <=> 3) # if 2 < 3 ans = -1, 2 == 3 ans = 0, 2 > 3 ans = 1
puts(2 .eql? '2')

# Varibles
#1.) local variable (starts with small letter or _)
# 2.) Global Varibles (starts with $)
# 2.) Instance Varibles (starts with @)
# 2.) Class Varibles (starts with @@)

class First
    $global = 'Global'
    @@class_var = 'Class'
    def initialize(name)
        @name = name
        local = name
        puts "My name is #@name"
        puts "Local variable #{local}"
        puts "This is Class Varible '#@@class_var'"
    end
    def name()
        puts "My Name is #@name"
        # puts "Local variable #{local}" #gives error
        puts "This is Global variabe '#$global'"
        puts "This is Class Varible '#@@class_var'"
    end
end
class Second
    def globaluse
        puts "This is Global variable '#$global'"
        # puts "This is Class Varible '#@@class_var'" #this gives error 
    end
end

name = First.new('Radhika')
name.name()
second = Second.new()
second.globaluse()

# Data types
# 1.) Number (Fixnum, Bignum, Float, Complex, Rational, BigDecimal)
# 2.) String
# 3.) Symbol (Start with : , no space allowed,join word by _ (:first_name),Like string but string represent values that change. while Symbols are unique identifiers and represent static values)
# 4.) Hashes ({"key1"=>"value1", "Key2" => "value2"})
# 5.) Array ([val1, val2, val3])

# if, if-else, if-else-if, ternary
print "Enter Number: "
age = gets.chomp.to_i
# if
if(age >= 18)
    puts "You are eligible"
end

# if-else
if(age >= 18)
    puts "You are eligible"
else
    puts "You are not eligible"
end

#if-else-if
if(age <= 1 && age >=0)
    puts "You are baby"
elsif(age > 1 && age <=5)
    puts "You are toddler"
elsif( age >=5 && age < 12)
    puts "You are schooler"
elsif(age >=12 && age <= 18)
    puts "You are teenager"
elsif(age >=18 && age <= 60)
    puts "You are adult"
else
    puts "You are senior citizen"
end

# ternary
result = age > 18 ? "Eligible" : "Not Eligible"
puts result

# case (like switch-case but in ruby it's called case)
print "Enter a day number: "
day = gets.chomp.to_i

case day
when 1
    puts "Day is Sunday"
when 2
    puts "Day is Monday"
when 3
    puts "Day is Tuesday"
when 4
    puts "Day is Wednesday"
when 5
    puts "Day is Thursday"
when 6
    puts 'Day is Friday'
when 7
    puts 'Day is Saturday'
else
    puts 'Please Enter Valid Number'
end

# for loop
print 'Enter Number : '
num = gets.chomp.to_i
for i in 1...num do
    puts i
end


puts
days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
for i in days do
    print i+" "
end

puts
days = {'1' => 'Sunday','2' =>'Monday','3' =>'Tuesday','4' =>'Wednesday','5' =>'Thursday','6' =>'Friday','7' =>'Saturday'}
for i in days do
    print i
end

# while loop
puts
print 'Enter Number : '
num = gets.chomp.to_i
while(num <= 5)
    puts num
    num += 1
end

# do-while
num = gets.chomp.to_i
loop do
    puts num
    num += 1
    if(num > 5)
    break
    end
end
