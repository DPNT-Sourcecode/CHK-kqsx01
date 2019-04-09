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

    it 'returns 130 when given ABDCD' do
        c = Checkout.new
        expect(c.checkout("ABDCD")).to eq(130)
    end

    it 'returns -1 when given Z' do
        c = Checkout.new
        expect(c.checkout("Z")).to eq(-1)
    end

    it 'returns -1 when given ABCDZ' do
        c = Checkout.new
        expect(c.checkout("ABCDZ")).to eq(-1)
    end

    it 'returns 130 when given AAA' do
        c = Checkout.new
        expect(c.checkout("AAA")).to eq(130)
    end

    it 'returns 200 when given AAAAA' do
        c = Checkout.new
        expect(c.checkout("AAAAA")).to eq(200)
    end

    it 'returns 380 when given AAAAAAAAA' do
        c = Checkout.new
        expect(c.checkout("AAAAAAAAA")).to eq(380)
    end

    it 'returns 45 when given BB' do
        c = Checkout.new
        expect(c.checkout("BB")).to eq(45)
    end

    it 'returns 290 when given AAAABBBCD' do
        c = Checkout.new
        expect(c.checkout("AAAABBBCD")).to eq(290)
    end

    it 'returns 80 when given BEE' do
        c = Checkout.new
        expect(c.checkout("BEE")).to eq(80)
    end
end