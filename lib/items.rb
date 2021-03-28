class Items
  # in case of user input consists of multiple items, spliting input to array
  def parse(items)
    items.chomp.downcase
    array = items.split(',')
  end

  def clean(array)
    aray = array.map { |n| n.strip}
  end
end