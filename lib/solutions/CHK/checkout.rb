# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {"D": 15}
  end

  def checkout(skus) 
    return @price_table[skus]
  end

end

