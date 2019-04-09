require './lib/solutions/CHK/checkout.rb'

describe Checkout do
    it 'returns 15 when given D' do
        c = Checkout.new
        expect(c.checkout("D")).to eq(15)
    end

    it 'returns 30 when given DD' do
        c = Checkout.new
        expect(c.checkout("DD")).to eq(30)
    end

    it 'returns 50 when given DCD' do
        c = Checkout.new
        expect(c.checkout("DCD")).to eq(50)
    end

    # For any illegal input return -1

end