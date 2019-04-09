# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"C" => 20, "D" => 15}
  end

  def checkout(skus) 
    costs = skus.chars.uniq.map do |char|
      skus.count(char) * @price_table[char]
    end

    total = costs.reduce(0) { |sum, num| sum + num }
    return total 
  end

end



