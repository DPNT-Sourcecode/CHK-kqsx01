# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"C" => 20, "D" => 15}
  end

  def checkout(skus) 
    costs = skus.chars.uniq.map do |char|
      skus.count(char) * @price_table[char]
    end

    total = 0
    costs.each do |cost| 
      total += cost
    end

    return total 
  end

end


