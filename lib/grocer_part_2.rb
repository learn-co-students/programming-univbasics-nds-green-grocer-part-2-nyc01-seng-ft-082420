require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  cart.each do |item|
    coupons.each do |couponItems|
      if item[:item] == couponItems[:item]
        price = couponItems[:cost] / couponItems[:num]
        number = 0
        while item[:count] >= couponItems[:num]
          item[:count] -= couponItems[:num]
          number += couponItems[:num]
        end
        cart.push({
          :item => item[:item] + " W/COUPON",
          :price => price,
          :clearance => item[:clearance],
          :count => number
        })
      end
    end
  end
end

def apply_clearance(cart)
  cart.each do |item|
    if item[:clearance]
      item[:price] = (item[:price] * 0.8).round(2)
    end
  end
end

def checkout(cart, coupons)
  total = 0
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  cart.each do |item| 
    total += item[:price] * item[:count]
  end
  if total > 100
    total *= 0.9
  end
  total
end
