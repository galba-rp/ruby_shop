require './lib/stock'
require './lib/discounts'

class Basket
  
attr_accessor :basket, :total
  def initialize()
    @basket = Hash.new
    @total = 0
    @fruits = Stock::FRUITS
    @discounts = Discounts:: DISCOUNT_CONDITIONS
  end

  def printBasket
    @basket.each { |n| puts 'Vous avez ' + n[1].to_s + ' ' + n[0]}
  end

  def addToBasket(item)
    return addDiscount() if item == "total"
    return puts"Fruits n'existe pas" if  !@fruits.include?(item)
 
    if @basket[item] != nil && @fruits.include?(item)
      @basket[item] += 1
    else
      @basket.store(item,1)
    end
    addToTotal(item)
  end

    def addToTotal(i)
      @total += @fruits[i]
    end

    def addDiscount
      @basket.each {|n| 
        @discounts.each { |i|
          @total -= n[1]/i[1] * i[2] if  i.include?(n[0])
        }
      }
      @total
    end

  
end