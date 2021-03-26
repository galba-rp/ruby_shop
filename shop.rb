require 'pry'
require './lib/item'
require './lib/stock'
require './lib/basket'


item = Item.new
bask  = Basket.new
total = 0


CHERRIE_DISCOUNT = 20
BANANAS_DISCOUNT = 150


print 'Entrez un fruit : '




def ceriseDiscount(bask)
  return bask['cerise'] / 2 * CHERRIE_DISCOUNT
  0
end

def ceriseDiscount(bask)
  return bask['cerise'] / 2 * CHERRIE_DISCOUNT
  0
end

def cleanItems(s)
  return s.strip
end

def bananeDiscount(bask)
  return bask['bananas'] / 2 * BANANAS_DISCOUNT
  0
end

ARGF.each do |prod|
  prod = prod.chomp.downcase
  arrayString = prod.split(',')
  cleanArray = arrayString.map { |n| item.clean(n) }
  cleanArray.each do |i|
    i.chomp
    bask.addToBasket(i)
  end
  bask.printBasket

  # discount = ceriseDiscount(bask.basket)
  # bananeDisc = bananeDiscount(bask.basket)
  # puts "Bananas disc #{bananeDisc}"
  # puts "Cerise discount : #{discount}"
  # puts "Total is #{(total - discount - bananeDisc)}"
  puts "Total is #{(bask.total)}"
  print 'Entrez un fruit : '
end
