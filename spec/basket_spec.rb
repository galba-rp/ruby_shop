require "spec_helper"
require "basket"

RSpec.describe Basket do
  # describe "#print basket" do
  #   it "return 'pommes 1'" do
  #     bask = described_class.new

  #     bask.basket.store('pommes', 1)
      
  #     expect(bask.printBasket).to eql("Vous avez 1 pommes")
  #   end
  # end
  describe "#calculate total" do
    it "returns 'total 175'" do
      bask = described_class.new
      bask.addToBasket("pommes")
      bask.addToBasket("pommes")

      expect(bask.total).to eql(200)
    end
  end
end