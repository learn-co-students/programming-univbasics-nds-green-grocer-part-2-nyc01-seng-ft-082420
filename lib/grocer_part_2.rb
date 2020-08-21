require_relative './part_1_solution.rb'
require "pry"
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each { |v| 
    cart.map { |value|
      if value[:item] == v[:item] && value[:count] >= v[:num]
          value[:count] -= v[:num]
          cart << {:item => "#{value[:item]} W/COUPON", :price => v[:cost]/v[:num], :clearance => value[:clearance], :count => v[:num]}
      else
        puts "#{value[:item]} is not eligible for discount"
      end
    }
  }
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.map { |v|
    if v[:clearance] == true
      v[:price] = (v[:price] * 0.8).round(2)
    end
  }
  cart
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
  shop_cart = consolidate_cart(cart)
  after_coupons = apply_coupons(shop_cart, coupons)
  clearance = apply_clearance(after_coupons)
  clearance.each{ |v|
    total += v[:price] * v[:count]
  }
  if total > 100
    total *= 0.9
  end
  total
end
