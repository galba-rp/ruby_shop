require "./lib/stock"
require "./lib/discounts"
require "./lib/db_data"
require "pry"

class Basket
  attr_accessor :basket, :total, :fruits

  def initialize
    @basket = {}
    @total = 0
    # @fruits = Stock::FRUITS
    @fruits = Db_data.new.fruit
    @discounts = Discounts::DISCOUNT_CONDITIONS
  end
  # n is an array of item's name and quantity
  def print_basket
    @basket.each { |n| puts "Vous avez " + n[1].to_s + " " + n[0] }
  end

  def add_to_basket(item)
    return add_discount if item == "Checkout"
    return puts "Fruits n'existe pas" unless @fruits.include?(item)

    if @basket[item] != nil && @fruits.include?(item)
      @basket[item] += 1
    else
      @basket.store(item, 1)
    end
    add_to_total(item)
  end

  def add_to_total(i)
    @total += @fruits[i]
  end
#TODO break the loop if product found
  def add_discount
    puts "disc"
    @basket.each { |n|
      @discounts.each { |i|
        @total -= n[1] / i[1] * i[2] if i.include?(n[0])
      }
    }
    @total
  end
end
