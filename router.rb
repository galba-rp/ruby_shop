require "tilt"
require "erb"
require 'json'

require "./lib/items"
require "./lib/stock"
require "./lib/basket"
require "./lib/controller"
require "pry"


class Router
  # def controller
  #   @controller ||= Controller.new
  # end
  
  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)

    # controller.params = req.params


    @items ||= Items.new
    @bask ||= Basket.new

    

    case path
      when "/"
        # controller.index
        template = Tilt.new('index.html.erb')

        [200, {"Content-Type" => "text/html"},  
          template.render(
            self, 
            product: @product,
            total: @total,
            basket: @bask 
         )
        ]
    
    
      when "/add"
        p @bask.basket
        @product = req.POST()["product"]
        @product = @items.parse(@product)
        @product = @items.clean(@product)
        
        
        @product.each do |i|
          i.chomp
          @bask.add_to_basket(i)
        end
        # @bask.add_to_basket(@product)
        @total = @bask.total
       
        [302, {'Location' => "/"}, []]

      
      else
        template = Tilt.new('not_found.html.erb')
        [404, {"Content-Type" => "text/html"}, template.render]
      end
  end
end