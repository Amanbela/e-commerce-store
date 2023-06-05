require_relative 'search'
#require'singleton'

class Browse

  def initialize(arr)
  @arr=arr
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
   def Add_product
     puts"Enter the product name:"
     name=gets.chomp.to_s
     if name.empty?
      puts "Product name cannot be empty."
      return 
    end
     
      @hash["Name"]=name
      puts"Enter the Brand name:"
      brand=gets.chomp.to_s
      if brand.empty?
        puts "Brand name cannot be empty."
        return 
      end
    
       
      @hash["Brand"]=brand
      puts"Enter the price of product:"
      price=gets.chomp.to_i
      
      if price <= 0
        puts "Price must be a positive number."
        return # Stop further execution of the method
      end
      @hash["Price"]=price
      
        @arr.push(@hash)
     puts @arr
    end
    

   def display_product
  
    puts "  Name          Brand          Price"

    puts"----------------------------------------------------------------------"
    @arr.each do|product|
      puts "#{product['Name']}   #{product['Brand']}   #{product['Price']}"
    end
    puts"----------------------------------------------------------------------"
  end
end


