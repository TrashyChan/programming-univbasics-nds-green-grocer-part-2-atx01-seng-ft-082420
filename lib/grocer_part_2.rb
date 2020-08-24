require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  new_hash = {}
  
  cart.each do |cart_items|
    coupons.each do |coupon_item|
      new_hash[:item] = "#{coupon_item[:item]} W/COUPON"
      if coupon_item[:cost] /= 2
        new_hash[:price] = coupon_item[:cost]
      end
      new_hash[:clearance] = cart_items[:clearance]
      if new_hash[:count] = coupon_item[:num]
        cart_items[:count] -= new_hash[:count]
      end
        cart_items.merge!(new_hash)
    end
  end
end


def apply_clearance(cart)
  cart.each do |clearance_item|
    if clearance_item[:clearance] == TRUE
      clearance_item[:price] *= 0.8
    end
  end
end

def checkout(cart, coupons)
  consol = consolidate_cart(cart)
  coupon = apply_coupons(consol, coupons)
  clearance = apply_clearance(coupon)
  
  total = 0
  
  consol.each do |cart|
    
  total = cart[:count] * cart[:price]
  total >= 100 ? total *= 0.9 : total
  end
end
