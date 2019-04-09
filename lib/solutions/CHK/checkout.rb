# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"A" => 50, "B" => 30, "C" => 20, "D" => 15}
    @offers = {"A" => [3, 130], "B" => [2, 45]}
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
    offer_qty = @offers[sku][0]
    offer_cost = @offers[sku][1] * (qty / offer_qty)
    non_offer_cost = @price_table[sku] * (qty % offer_qty)
    return offer_cost + non_offer_cost
  end
end
