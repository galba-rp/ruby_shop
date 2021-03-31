require "tilt"
require "erb"
require "./lib/items"
require "./lib/stock"
require "./lib/basket"

require "pry"

class Controller
attr_accessor :params

  def index
    total = basket.total
    cart = basket.basket

    render "index", total: total, basket:cart
  end

  def add
    product = items.parse(params["product"])
    product = items.clean(product)

    product.each do |i|
      i.chomp
      basket.add_to_basket(i)
    end
    
    redirect "/"
  end

  def not_found
    template = Tilt.new("not_found.html.erb")

    [404, {"Content-Type" => "text/html"}, template.render]
  end

  private

  def basket
    # memoization
    @basket ||= Basket.new
  end

  def items
    # memoization
    @items ||= Items.new
  end

  def render(target, **view_params)
    template = Tilt.new("#{target}.html.erb")

    [200, {"Content-Type" => "text/html"}, template.render(self, view_params)]
  end

  def redirect(to)
    [302, {"Location" => to}, []]
  end

end