require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  
  coupons.each do |coupon|
    discount_item = find_item_by_name_in_collection(coupon[:item], cart) 
    if discount_item
      
      how_many_can_be_discounted = (discount_item[:count]/coupon[:num]) * coupon[:num]
        
      discount_item[:count] = discount_item[:count] - how_many_can_be_discounted
        
        cart << {:item => "#{coupon[:item]} W/COUPON",
          :price => coupon[:cost]/coupon[:num],
          :clearance => discount_item[:clearance],
          :count => how_many_can_be_discounted
        }

      end
  
  end
  cart
end

def apply_clearance(cart)
  cart_discounted = []
  
  cart.each do |hash|
  if hash[:clearance] == true 
     hash[:price] = hash[:price] * 0.8
  end
    cart_discounted << hash
  end
  cart_discounted
end

def checkout(cart, coupons)
  
  
   new_cart = consolidate_cart(cart)
   applied_coupons = apply_coupons(new_cart, coupons)
   clearanced_cart = apply_clearance(applied_coupons)

  total = 0
  clearanced_cart.each do |item| total += item[:price]*item[:count]
  
  end
  total.round(2) > 100 ? total.round(2) * 0.9 : total.round(2)
  

  
 


  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
 
   
end
