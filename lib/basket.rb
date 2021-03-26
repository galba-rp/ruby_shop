require './lib/stock'

class Basket
  
attr_accessor :basket, :total
  def initialize()
    @basket = Hash.new
    @total = 0
    @fruits = Stock::FRUITS
  end

    def printBasket
      @basket.each { |n| puts 'Vous avez ' + n[1].to_s + ' ' + n[0]}
    end

    def addToBasket(item)
      return puts"Fruits n'existe pas" if  !@fruits.include?(item)
      if @basket[item] != nil && @fruits.include?(item)
        @basket[item] += 1
      else
        @basket.store(item,1)
      end

    end

    def calculateTotal
      @basket.each {|n|  @total +=n[1]}
      return @total
    end

  
end