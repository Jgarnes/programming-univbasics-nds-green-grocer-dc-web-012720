def find_item_by_name_in_collection(name, collection)
 i = 0 
 while i < collection.length do 
  if collection[i][:item] == name 
    return collection[i] 
  end 
   i += 1 
  end   
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  new_array = [] 
  i = 0 
  while i < cart.length do 
<<<<<<< HEAD
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_array)
    if new_cart_item != nil 
       new_cart_item[:count] += 1 
    else    
    new_cart_item = {
=======
    cart_item = find_item_by_name_in_collection(cart[i][:item], new_array)
  cart_item != nil ? cart_item[:count] += 1 : cart_item = {
>>>>>>> eec025c3c45bea0b468ccd9f29085b30e69bcdb4
    :item => cart[i][:item],
    :price => cart[i][:price],
    :clearance => cart[i][:clearance],
    :count => 1 
  }
<<<<<<< HEAD
   new_array << new_cart_item
  end 
  i += 1 
end 
new_array
=======
   new_array << cart_item
  end 
  i += 1 
>>>>>>> eec025c3c45bea0b468ccd9f29085b30e69bcdb4
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  i = 0 
  while i < coupons.length do 
    cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
    coupon_item_name = "#{coupons[i][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
    if cart_item && cart_item[:count]>= coupons[i][:num]
    if cart_item_with_coupon
      cart_item_with_coupon[:count] += coupons[i][:num]
      cart_item[:count] -= coupons[i][:num]
    else 
      cart_item_with_coupon = {
        :item => coupon_item_name,
        :price => coupons[i][:cost] / coupons[i][:num],
        :count => coupons[i][:num],
        :clearance => cart_item[:clearance]
      }
      cart << cart_item_with_coupon
      cart_item[:count] -= coupons[i][:num]
    end 
      
    end 
    
    
    i += 1 
  end
  cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  i = 0 
  while i < cart.length do 
   if cart[i][:clearance] 
    cart[i][:price] = (cart[i][:price] - (cart[i][:price] * 0.20)).round(2)
  end 
  i += 1 
end
cart 
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  
  total = 0 
  i = 0 
  while i < final_cart.length do 
    total += final_cart[i][:price] * final_cart[i][:count]
    i += 1 
  end 
  if total > 100
    total -= (total * 0.10)
  end 
  total
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
