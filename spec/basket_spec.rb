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
    it "returns 'total 275'" do
      bask = described_class.new
      bask.addToBasket("pommes")
      bask.addToBasket("pommes")
      bask.addToBasket("cerise")

      expect(bask.total).to eql(275)
    end
  end

  describe "#add discount" do
    it "returns 'total 275'" do
      bask = described_class.new
      bask.addToBasket("pommes")
      bask.addToBasket("cerise")
      bask.addToBasket("cerise")
      bask.addToBasket("bananas")
      bask.addToBasket("bananas")
      bask.addDiscount

      expect(bask.total).to eql(380)
    end
  end
end