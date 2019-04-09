# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"A" => 50, "B" => 30, "C" => 20, "D" => 15}
    @offers = {"A" => {3 => 130}}
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
      skus.count(char) * @price_table[char] 
    }
  end

end

