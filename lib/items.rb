class Items

  def parse(items)
    items.chomp.downcase
    array = items.split(',')
  end

  def clean(array)
    aray = array.map { |n| n.strip}
  end
end