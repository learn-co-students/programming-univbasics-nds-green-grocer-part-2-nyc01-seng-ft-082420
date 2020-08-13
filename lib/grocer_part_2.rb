require_relative './part_1_solution.rb'
require "pry"

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart.each do |item|
    coupons.each do |coup|
      if coup[:item] == item[:item]
        if item[:count] >= coup[:num]
          cart << {:item => "#{item[:item]} W/COUPON", :price => coup[:cost] / coup[:num], :clearance => item[:clearance], :count => coup[:num]}
          item[:count] -= coup[:num]
        end     
      end   
    end  
  end  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item|
    if item[:clearance] == true
      item[:price] -= (item[:price] * 0.2).round(2)
    end  
  end 
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  total = 0
  cons_cart = consolidate_cart(cart)
  applied_coupons = apply_coupons(cons_cart, coupons)
  applied_clearance = apply_clearance(applied_coupons)
  applied_clearance.each do |item|
    total += item[:price] * item[:count]
  end 
  if total > 100
   total -= (total * 0.1).round(2)
  end   
  total  
end
