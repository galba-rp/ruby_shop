require "spec_helper"
require "greeting"

RSpec.describe Greeting do
  describe "#hello" do
    it "return 'Hello world'" do
      #Arraneg
      greeting = described_class.new
      #Assert
      expect(greeting.hello).to eql("Hello world")
    end
  end

  describe "#bye", :focus do
    it "return 'Bye-bye slavko'" do
      greeting = described_class.new

      expect(greeting.goodBye("slavko")).to eql("Bye-bye slavko")
    end
  end
end