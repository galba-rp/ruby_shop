require 'sqlite3'
require 'pry'

class Db_data
  attr_accessor :fruit
  def initialize
    @db ||= SQLite3::Database.new 'myshopDB.db'
    @fruits = @db.execute 'SELECT * FROM products' 
    @fruit = {}
  @fruits.each { |i|  @fruit.store(i[1],i[2])}
  end

end