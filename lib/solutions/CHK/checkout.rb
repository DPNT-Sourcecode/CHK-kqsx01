# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"A" => 50, "B" => 30, "C" => 20, "D" => 15, "E" => 40}
    @offers = {"A" => [[5, 200], [3, 130]], "B" => [[2, 45]]}
    @offer_other_products = {"E" => [2, "B"]}
  end

#  create a hash of skus to occurances
#  look for offers of other products to reduce the occurances if any products are free
#  then use that hash to work out the costs


  def checkout(skus) 
    return -1 if validate(skus) == -1
    costs = costs(skus)
    p "costs #{costs}"
    total = costs.reduce(0) { |sum, num| sum + num }
    
    discounts = discounts(skus).reduce(0) { |sum, num| sum + num }
    p "discounts #{discounts}"
    total -= discounts
    return total 
  end

  def validate(skus)
    skus.chars.uniq.each { |char|
      return -1 if @price_table[char] == nil
    }
    return 0
  end 

  def costs(skus)
    return skus.chars.uniq.map { |char| 
      @offers[char] == nil ? skus.count(char) * @price_table[char] 
                        : offer_cost(char, skus.count(char))
    }
  end

  def offer_cost(sku, qty)
    offers = @offers[sku]
    offer_cost = 0
    non_offer_qty = offers.reduce(qty) { |rem, offer| 
      if qualify?(offer, rem)
        offer_cost += offer[1] * (rem / offer[0])
      end
      rem % offer[0]
    }
    non_offer_cost = @price_table[sku] * non_offer_qty
    return offer_cost + non_offer_cost
  end

  def qualify?(offer, qty)
    return qty >= offer[0] ? true : false
  end

  def discounts(skus)
    return skus.chars.uniq.map { |char|
      @offer_other_products[char] == nil ? 0
        : discount(char, skus)
    }
  end

  def discount(char, skus)
    p "char #{char}"
    discount = @offer_other_products[char]
    p "discount #{discount}"
    discount_qty = skus.count(char) / discount[0]
    p "discount_qty #{discount_qty}"
    if skus.include?(discount[1])
      if skus.count(discount[1]) < discount_qty
        p "A #{skus.count(discount[1]) * @price_table[discount[1]]} "
        return skus.count(discount[1]) * @price_table[discount[1]]
      else
        p "B #{discount_qty * @price_table[discount[1]]}"
        return discount_qty * @price_table[discount[1]]
      end
    end 
  end
end

