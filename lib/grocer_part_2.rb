require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  couponed_array = []
  if coupons.length > 0
    coupons.map do |coupon|
      cart.map do |grocery_item|
      couponed_item = {}
        if grocery_item[:item] == coupon[:item] && grocery_item[:count] >= coupon[:num]
          couponed_item[:item] = "#{grocery_item[:item]} W/COUPON"
          couponed_item[:price] = coupon[:cost] / coupon[:num]
          couponed_item[:clearance] = grocery_item[:clearance]
          if grocery_item[:count] % coupon[:num] == 0
            couponed_item[:count] = grocery_item[:count]
            grocery_item[:count] = grocery_item[:count] - couponed_item[:count]
          else
            couponed_item[:count] = grocery_item[:count] - (grocery_item[:count] % coupon[:num]) 
            grocery_item[:count] = grocery_item[:count] % coupon[:num]
          end
        end
        couponed_array << grocery_item
        couponed_array << couponed_item
      end
    end
  else
    couponed_array = cart
  end
  couponed_array
end

def apply_clearance(cart)
  new_cart = cart
  new_cart.map do |grocery_item|
    if grocery_item[:clearance]
      grocery_item[:price] -= (grocery_item[:price] * 0.20).round(2)
    end
  end
  new_cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  discounted_cart = apply_clearance(couponed_cart)
  
  total = 0.00
  discounted_cart.each do |grocery_item|
    total += grocery_item[:price] * grocery_item[:count]
  end
  if total > 100.00
    total -= (total * 0.10)
  end
  total
end
