require "pry"
require "./lib/items"
require "./lib/stock"
require "./lib/basket"

# items = Items.new
bask = Basket.new

print "Entrez un fruit : "

ARGF.each do |prod|
  prod_parsed = items.parse(prod)
  prod_cleaned = items.clean(prod_parsed)

  prod_cleaned.each do |i|
    i.chomp
    bask.add_to_basket(i)
  end
  bask.print_basket
  puts "Total is #{bask.total}"
  print "Entrez un fruit : "
end
