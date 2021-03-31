require "tilt"
require "erb"
require 'json'

require "./lib/items"
require "./lib/stock"
require "./lib/basket"
require "./lib/controller"
require "pry"


class Router
  def controller
    @controller ||= Controller.new
  end
  
  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)

    controller.params = req.params    

    case path
      when "/"
        controller.index
      when "/add"
        controller.add
      else
        controller.not_found
      end
  end
end