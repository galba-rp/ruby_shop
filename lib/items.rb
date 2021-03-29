class Items
  # in case of user input consists of multiple items, spliting input to array
  def parse(items)
    items.chomp.downcase
    items.split(",")
  end

  def clean(array)
    array = array.map(&:strip)
  end
end
