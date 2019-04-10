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

    it 'returns -1 when given 1' do
        c = Checkout.new
        expect(c.checkout("1")).to eq(-1)
    end

    it 'returns -1 when given ABCD8' do
        c = Checkout.new
        expect(c.checkout("ABCD8")).to eq(-1)
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

    it 'returns 190 when given BBBEEEE' do
        c = Checkout.new
        expect(c.checkout("BBBEEEE")).to eq(190)
    end

    it 'returns 20 when given FFF' do
        c = Checkout.new
        expect(c.checkout("FFF")).to eq(20)
    end

    it 'returns 20 when given G' do
        c = Checkout.new
        expect(c.checkout("G")).to eq(20)
    end

    it 'returns 10 when given H' do
        c = Checkout.new
        expect(c.checkout("H")).to eq(10)
    end

    it 'returns 35 when given I' do
        c = Checkout.new
        expect(c.checkout("I")).to eq(35)
    end

    it 'returns 60 when given J' do
        c = Checkout.new
        expect(c.checkout("J")).to eq(60)
    end

    it 'returns 70 when given K' do
        c = Checkout.new
        expect(c.checkout("K")).to eq(70)
    end

    it 'returns 90 when given L' do
        c = Checkout.new
        expect(c.checkout("L")).to eq(90)
    end

    it 'returns 15 when given M' do
        c = Checkout.new
        expect(c.checkout("M")).to eq(15)
    end

    it 'returns 40 when given N' do
        c = Checkout.new
        expect(c.checkout("N")).to eq(40)
    end

    it 'returns 10 when given O' do
        c = Checkout.new
        expect(c.checkout("O")).to eq(10)
    end

    it 'returns 50 when given P' do
        c = Checkout.new
        expect(c.checkout("P")).to eq(50)
    end

    it 'returns 30 when given Q' do
        c = Checkout.new
        expect(c.checkout("Q")).to eq(30)
    end

    it 'returns 50 when given R' do
        c = Checkout.new
        expect(c.checkout("R")).to eq(50)
    end

    it 'returns 20 when given S' do
        c = Checkout.new
        expect(c.checkout("S")).to eq(20)
    end

    it 'returns 20 when given T' do
        c = Checkout.new
        expect(c.checkout("T")).to eq(20)
    end

    it 'returns 40 when given U' do
        c = Checkout.new
        expect(c.checkout("U")).to eq(40)
    end

    it 'returns 50 when given V' do
        c = Checkout.new
        expect(c.checkout("V")).to eq(50)
    end

    it 'returns 20 when given W' do
        c = Checkout.new
        expect(c.checkout("W")).to eq(20)
    end

    it 'returns 17 when given X' do
        c = Checkout.new
        expect(c.checkout("X")).to eq(17)
    end

    it 'returns 20 when given Y' do
        c = Checkout.new
        expect(c.checkout("Y")).to eq(20)
    end

    it 'returns 21 when given Z' do
        c = Checkout.new
        expect(c.checkout("Z")).to eq(21)
    end

    it 'returns 45 when given HHHHH' do
        c = Checkout.new
        expect(c.checkout("HHHHH")).to eq(45)
    end

    it 'returns 80 when given HHHHHHHHHH' do
        c = Checkout.new
        expect(c.checkout("HHHHHHHHHH")).to eq(80)
    end

    it 'returns 120 when given KK' do
        c = Checkout.new
        expect(c.checkout("KK")).to eq(120)
    end

    it 'returns 200 when given PPPPP' do
        c = Checkout.new
        expect(c.checkout("PPPPP")).to eq(200)
    end

    it 'returns 80 when given QQQ' do
        c = Checkout.new
        expect(c.checkout("QQQ")).to eq(80)
    end

    it 'returns 120 when given UUUU' do
        c = Checkout.new
        expect(c.checkout("UUUU")).to eq(120)
    end

    it 'returns 90 when given VV' do
        c = Checkout.new
        expect(c.checkout("VV")).to eq(90)
    end

    it 'returns 130 when given VVV' do
        c = Checkout.new
        expect(c.checkout("VVV")).to eq(130)
    end

    it 'returns 120 when given NNNM' do
        c = Checkout.new
        expect(c.checkout("NNNM")).to eq(120)
    end

    it 'returns 150 when given RRRQ' do
        c = Checkout.new
        expect(c.checkout("RRRQ")).to eq(150)
    end

end

