require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  couponed_array = []
  couponed_item = {}
  coupons.each do |coupon|
    cart.map do |grocery_item|
      if grocery_item[:item] == coupon[:item]
        couponed_item[:item] = "#{grocery_item[:item]} W/ COUPON"
        couponed_item[:price] = coupon[:cost] / coupon[:num]
        couponed_item[:clearance] = grocery_item[:clearance]
        couponed_item[:count] = grocery_item[:count]
        couponed_array << grocery_item
        couponed_array << couponed_item
      end
    end
  end
  binding.pry
  return couponed_array
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

# def checkout(cart, coupons)
#   # Consult README for inputs and outputs
#   #
#   # This method should call
#   # * consolidate_cart
#   # * apply_coupons
#   # * apply_clearance
#   #
#   # BEFORE it begins the work of calculating the total (or else you might have
#   # some irritated customers
# end
