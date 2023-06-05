require_relative 'browse'

class Search
  def initialize(arr)
    @arr = arr
  end

  # Product display
  def search
    puts "Enter the product name you want to search:"
    search_name = gets.chomp.to_s.strip

    if search_name.empty?
      puts "Search is empty. Please enter a valid product name."
      return
    end

    if @arr.empty?
      puts "The array is empty. Please go to Browse and add elements to the array."
      return
    end

    found = false

    @arr.each do |product|
      if product["Name"].include?(search_name)
        puts "#{product["Name"]}  #{product["Brand"]}  #{product["Price"]}"
        found = true
      end
    end

    if !found
      puts "No product found with the given name."
    end
  end
end
