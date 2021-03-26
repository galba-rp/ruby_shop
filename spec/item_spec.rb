require "spec_helper"
require "item"

RSpec.describe Item do
  describe "#clean" do
    it "return 'pommes'" do
      item = described_class.new
      
      expect(item.clean(" pommes  ")).to eql("pommes")
    end
  end
end