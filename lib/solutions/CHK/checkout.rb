# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"A" => 50, "B" => 30, "C" => 20, "D" => 15, "E" => 40, "F" => 10,
      "G" => 20, "H" => 10, "I" => 35, "J" => 60, "K" => 70, "L" => 90,
      "M" => 15, "N" => 40, "O" => 10, "P" => 50, "Q" => 30, "R" => 50,
      "S" => 20, "T" => 20, "U" => 40, "V" => 50, "W" => 20, "X" => 17,
      "Y" => 20, "Z" => 21}
    @offers = {"A" => [[5, 200], [3, 130]], "B" => [[2, 45]], "F" => [[3, 20]],
      "H" => [[10, 80], [5, 45]], "K" => [[2, 120]], "P" => [[5, 200]],
      "Q" => [[3, 80]], "U" => [[4, 120]], "V" => [[3, 130], [2, 90]]}
    @offer_other_products = {"E" => [2, "B"], "N" => [3, "M"], "R" => [3, "Q"]}
  end

#  create a hash of skus to occurances
#  look for offers of other products to reduce the occurances if any products are free
#  then use that hash to work out the costs


  def checkout(skus) 
    return -1 if validate(skus) == -1
    @sku_counts = count_each_sku(skus)
    @sku_counts_minus_free_prods = remove_free_products
    costs = costs(sku_counts_minus_free_prods)
    total = costs.reduce(0) { |sum, num| sum + num }
    return total 
  end

  def group_discounts(sku_counts)
    # count no of S, T, X, Y, Z
    # add 45 to total for each group of 3 
    # reduce counts so that the skus are not costed again in the next step
    total = 0
    group_count = sku_counts["S"] + sku_counts["T"] + sku_counts["X"] +
    sku_counts["Y"] + sku_counts["Z"] 
    if group_count >= 3
      reduce_counts = (group_count / 3) 
      total = 45 * reduce_counts
      ["S", "T", "X", "Y", "Z"].each { |char| 
        if reduce_counts > 0
          if reduce_counts > sku_counts[char]
            reduce_counts -= sku_counts[char]
            sku_counts[char] = 0
          else
            sku_counts[char] -= reduce_counts
            reduce_counts = 0
          end
        end
      }
    end
  end

  def remove_free_products
    new_counts = {}
    @sku_counts.each { |char, count|
      new_qty = count
      if @offer_other_products[char] != nil 
        free_qty = new_qty / @offer_other_products[char][0]
        free_sku = @offer_other_products[char][1]
        no_bought = @sku_counts[free_sku] == nil ? 0 : @sku_counts[free_sku]
        new_qty = no_bought - free_qty <= 0 ? 0 : no_bought - free_qty
        new_counts[free_sku] = new_qty
      end
    }
    new_counts.each { |char, count|
      @sku_counts[char] = count
    }
    return @sku_counts
  end

  def count_each_sku(skus)
    sku_counts = {}
    skus.chars.uniq.each { |char|
      sku_counts[char] = skus.count(char)
    }
    return sku_counts
  end 

  def validate(skus)
    skus.chars.uniq.each { |char|
      return -1 if @price_table[char] == nil
    }
    return 0
  end 

  def costs(sku_counts)
    costs = []
    costs.push(group_discounts(sku_counts))
    sku_counts.each { |char, count| 
      cost = @offers[char] == nil ? count * @price_table[char] 
                        : offer_cost(char, count)
      costs.push(cost)
    }
    return costs
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
end
