# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"A" => 50, "B" => 30, "C" => 20, "D" => 15}
  end

  def checkout(skus) 
    costs = skus.chars.uniq.map { |char| 
      skus.count(char) * @price_table[char] 
    }

    total = costs.reduce(0) { |sum, num| sum + num }
    return total 
  end

end
