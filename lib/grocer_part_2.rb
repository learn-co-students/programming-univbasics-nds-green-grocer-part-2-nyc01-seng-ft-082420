require_relative './part_1_solution.rb'
require 'pry'

def find_item_index_in_collection(name, collection)
  index = 0

  collection.each do |grocery_item|
    return index if grocery_item[:item] === name
    index += 1
  end

  nil
end

def apply_coupons(cart, coupons)
  coupons.each do | coupon_i |
    discounted_item = find_item_by_name_in_collection(coupon_i[:item], cart)
    discounted_item_cost = coupon_i[:cost]/coupon_i[:num]
    # binding.pry
    if discounted_item[:count] >= coupon_i[:num]
      new_item = {
        :item => "#{discounted_item[:item]} W/COUPON",
        :price => discounted_item_cost,
        :clearance => discounted_item[:clearance],
        :count => coupon_i[:num]
      }
      cart << new_item
      cart_index_number = find_item_index_in_collection(coupon_i[:item], cart)
      cart[cart_index_number][:count]-= new_item[:count]
    end
  end
  # cart.delete_if { |cart_item| cart_item[:count]<= 0}
  cart
end

def apply_clearance(cart)
  cart.each do |cart_item|
    if cart_item[:clearance]
      cart_item[:price] = cart_item[:price]*0.8
      cart_item[:price] = cart_item[:price].round(2)
    end
  end

  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  applied_coupons = apply_coupons(consolidated_cart, coupons)
  applied_clearance = apply_clearance(applied_coupons)
  total = 0
  applied_clearance.each do | item |
    total = total + item[:price]*item[:count]
  end
  if total > 100
    total = total * 0.9
  end
  total
end
