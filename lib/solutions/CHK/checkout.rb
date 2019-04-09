# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"A" => 50, "B" => 30, "C" => 20, "D" => 15}
    @offers = {"A" => [[5, 200], [3, 130]], "B" => [2, 45]}
  end

  def checkout(skus) 
    return -1 if validate(skus) == -1
    costs = costs(skus)
    total = costs.reduce(0) { |sum, num| sum + num }
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
    # go through each offer, starting with biggest qty, calc offer cost and pass the remainder as the qty for looking at the next offer

    non_offer_cost = @price_table[sku] * non_offer_qty
    return offer_cost + non_offer_cost
  end
end
