require 'oystercard'

RSpec.describe Oystercard do
  describe "#balance" do
    it "balance is 0" do
      expect(subject.balance).to eq 0
    end
  end
  describe "#top_up" do
    it "increases balance by top up amount" do
      # subject.top_up(10)
      # expect(subject.balance).to eq 10
      expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end
  end
end
