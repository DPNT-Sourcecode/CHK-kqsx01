# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"D" => 15}
  end

  def checkout(skus) 
    qty = skus.count("D")
    return @price_table["D"] * qty
  end

end

