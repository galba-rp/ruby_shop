require "spec_helper"
require "items"

RSpec.describe Items do
  describe "#parse" do
    it "return '[pommes, cerise]'" do
      items = described_class.new

      expect(items.parse("pommes, cerise")).to eql(["pommes"," cerise"])
    end
  end

  describe "#clean" do
    it "return '[pommes, cerise]'" do
      items = described_class.new

      expect(items.clean(["pommes"," cerise"])).to eql(["pommes","cerise"])
    end
  end
end