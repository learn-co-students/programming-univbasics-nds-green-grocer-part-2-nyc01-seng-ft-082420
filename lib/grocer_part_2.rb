require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  cart.each do |item|
    coupons.each do |coupon|
      if item[:item] == coupon[:item]
        name = item[:item]
        cart << {
          :item => "#{name} W/COUPON",
          :price => (coupon[:cost] / coupon[:num]).to_f,
          :clearance => item[:clearance],
          :count => coupon[:num]
        }
        if item[:count] >= coupon[:num]
          item[:count] -= coupon[:num]
        end
      end
    end
  end
end

def apply_clearance(cart)
  cart.map do |item|
    if item[:clearance] == true
      item[:price] = (item[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(new_cart, coupons.uniq)
  clearance_cart = apply_clearance(coupon_cart)
  total = 0
  
  clearance_cart.each do |cart_data|
    total += cart_data[:price] * cart_data[:count]
  end
  
  if total >= 100.0
    total -= (total * 0.1)
  else
    total
  end
end
