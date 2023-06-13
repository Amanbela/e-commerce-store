require_relative 'userregistration'
require 'io/console'
class Home
  def initialize
    @users = []
    @current_log=nil
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
          puts "Enter username:"
          username = gets.chomp
          puts "Enter password:"
          password = STDIN.noecho(&:gets).chomp
          UserRegistration.new(@users,@current_log).registra(username,password)
        when 2
          
            UserRegistration.new(@users,@current_log).login
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
