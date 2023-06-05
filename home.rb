require_relative 'userregistration'
require_relative 'user'
require 'io/console'
$login=false
class Home
  def initialize
    @store = ECommerceStore.new
    @u1 = User2.new
  
  end

  def start
    loop do
      puts "-------------------------------"
      puts "------Welcome to E-commerce Store-----"
      puts "1. User Register"
      puts "2. User Login"
      puts "3. Exit"
      print "Enter your choice: "
      choice = gets.chomp.to_i

      case choice
      when 1
        if $login == false
          puts "Enter username:"
          username = gets.chomp
          puts "Enter password:"
          password = STDIN.noecho(&:gets).chomp
          @store.registra(username, password)
        else
          puts "First log out, then register."
        end
      when 2
        puts "Enter username: "
        username = gets.chomp.to_s
        puts "Enter password: "
        password = gets.chomp.to_s
        @store.login(username, password)
        if $login == true
          @u1.user1
        end
      when 3
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end

home = Home.new
home.start
