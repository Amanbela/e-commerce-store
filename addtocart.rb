require_relative 'search'
require 'date'
require_relative 'browse'

class Cart
  attr_accessor :product, :product_price, :value, :number_of_quantity

  def initialize(arr, cart)
    @arr = arr
    @cart = cart
  end

  def add_to_cart
    search_name_index

    if @index.nil?
      puts "Product not found."
      return
    end

    @product = @arr[@index]["Name"]
    @product_price = @arr[@index]["Price"]

    puts "#{@product}"
    puts "#{@product_price}"
    puts "Enter the Product Quantity"
    @number_of_quantity = gets.chomp.to_i

    if @number_of_quantity <= 0
      puts "Invalid quantity. Please enter a positive number."
      return
    end

    cart_item = {
      "product": @product,
      "price": @product_price,
      "quantity": @number_of_quantity
    }

    @cart.push(cart_item)

    puts "Product Added Successfully..."
  end

  def display_cart
    @cart.each do |item|
      puts "#{item[:product]}: #{item[:price]} - Quantity: #{item[:quantity]}"
    end
  end

  def check_out
    puts "Enter the Shipping Address"
    address = gets.chomp.to_s

    puts "Payment Method: Credit Card"
    puts "Enter your credit card number:"
    creditcard = gets.chomp.to_i

    puts "Enter the expiration date (MM/YYYY):"
    month = gets.chomp
    year = gets.chomp

    puts "Enter the CVV:"
    cvv = gets.chomp.to_i

    if month =~ /^(0[1-9]|1[0-2])$/ && year =~ /^(20[2-9][3-9]|50[2-9][3-9])$/
      puts "Credit Card Number: #{creditcard}"
      puts "Expiration date: #{month}/#{year}"
      puts "CVV: #{cvv}"
      calculate_total_amount
      generate_order_id
      puts "Order Placed Successfully..."
    else
      puts "Invalid card expiration date or CVV."
    end
  end
 
  def order_history
    if @cart.empty?
      puts "No order history. Please check out first."
    else
      generate_order_id
      puts "OrderID: #{@randomNumber}"
      calculate_total_amount
      puts "Total Amount: #{@value}"
      current_date = Date.today
      puts "Date: #{current_date}"
    end
  end

  def calculate_total_amount
    @value = 0
    @cart.each do |info|
      @value += info[:price] * info[:quantity]
    end
  end

  def generate_order_id
    min = 999
    max = 9999
    @randomNumber = rand(min..max)
    #puts "OrderID: #{@randomNumber}"
  end

  def search_name_index
    puts "Enter the product name"
    search_name = gets.chomp.to_s
    if search_name=~(/[a-zA-Z]/)
     @index = nil
     @arr.each_with_index do |product, i|
      if product["Name"].include?(search_name)
        @index = i
        break
       end
      end
    end

    if @index.nil?
      puts "Product not found."
    else
      puts "Product found at index #{@index}."
    end
  end
end
