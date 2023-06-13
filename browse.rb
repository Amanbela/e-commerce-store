require_relative 'search'
#require'singleton'

class Browse

  def initialize(arr,current_log)
  @arr=arr
  @current_log=current_log
  @hash={}
  end
  def product_list
    @hash={
      "Name"=>"Shirt",
      "Brand"=>"Levi's",
      "Price"=>2199
    }
    
    @arr.push(@hash)

    @hash={
      "Name"=>"T-Shirt",
      "Brand"=>"PUMA",
      "Price"=>1199
    }

    @arr.push(@hash)

    @hash={
      "Name"=>"Shoes",
      "Brand"=>"Adidas",
      "Price"=>3999
    } 
    @arr.push(@hash)

    @hash={
      "Name"=>"Sneaker",
      "Brand"=>"NIKE",
      "Price"=>4999
    }
    @arr.push(@hash)

    @hash={
      "Name"=>"Jeans",
      "Brand"=>"MUFTI",
      "Price"=>2199
    }
    @arr.push(@hash)
     puts @arr  
  end
  def add_product
    attempts = 3
  
    begin
      puts "Enter the product name:"
      name = gets.chomp.to_s.strip
      attempts -= 1
  
      if name.empty?
        puts "Product name cannot be empty."
        raise "InvalidProductInput"
      end
    rescue
      if attempts.zero?
        puts "Maximum attempts reached. Returning without adding the product."
        return
      end
  
      retry
    end
  
    @hash["Name"] = name
  
    begin
      puts "Enter the Brand name:"
      brand = gets.chomp.to_s.strip
  
      if brand.empty?
        puts "Brand name cannot be empty."
        raise "InvalidProductInput"
      end
    rescue
      puts "Returning without adding the product."
      return
    end
  
    @hash["Brand"] = brand
  
    begin
      puts "Enter the price of the product:"
      price = gets.chomp.to_i
  
      if price <= 0
        puts "Price must be a positive number."
        raise "InvalidProductInput"
      end
    rescue
      puts "Returning without adding the product."
      return
    end
  
    @hash["Price"] = price
  
    @arr.push(@hash)
    puts @arr
  end
  
end


