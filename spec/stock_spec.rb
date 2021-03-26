require "spec_helper"
require "stock"

RSpec.describe Stock do
 
    it "return 'bananas'" do
      #stock = described_class.new
      
      expect(Stock::FRUITS.keys[0]).to eql('bananas')
    end
end