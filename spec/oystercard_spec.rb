require 'oystercard'

RSpec.describe Oystercard do

  describe "#balance" do
    it "initial balance is 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do

    it "increases balance by top up amount" do
      # subject.top_up(10)
      # expect(subject.balance).to eq 10
      expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end

    it "throws error if top up balance exceeds limit" do
      amount = Oystercard::MAX_BALANCE
      message = "Exceeds balance limit of #{amount}"
      expect { subject.top_up(amount + 1) }.to raise_error(message)
    end
  end

  describe "journey" do

    it "is initially not in a journey" do
      expect(subject).not_to be_in_journey
    end

    it "is initially going to have no journey history" do
      expect(subject.journeys).to be_empty
    end

    it "creates one journey on touch in and touch out" do
      subject.top_up(10)
      subject.touch_in("London Bridge", 1)
      subject.touch_out("Charing Cross", 1)
      expect(subject.journeys.count).to eq 1
    end

    context "touch in" do
      it "touch in sets the card to in journey" do
        subject.top_up(10)
        subject.touch_in("London Bridge", 1)
        expect(subject).to be_in_journey
      end
      it "throws error if touch in when balance is below min" do
        message = "Balance is too low: #{subject.balance}"
        expect { subject.touch_in("London Bridge", 1) }.to raise_error(message)
      end
      it "touch in sets the entry station" do
        subject.top_up(10)
        subject.touch_in("London Bridge", 1)
        expect(subject.journey.entry_station.name).to eq("London Bridge")
      end
    end

    context "touch out" do
      it "touch out sets the card to not in journey" do
        subject.top_up(10)
        subject.touch_in("London Bridge", 1)
        subject.touch_out("Charing Cross", 1)
        expect(subject).not_to be_in_journey
      end
      it "touch out deducts min fare from balance" do
        subject.top_up(10)
        subject.touch_in("London Bridge", 1)
        amount = Journey::MIN_FARE
        expect { subject.touch_out("Charing Cross", 1) }.to change{ subject.balance }.by -amount
      end
      it "touch out removes the entry station" do
        subject.top_up(10)
        subject.touch_in("London Bridge", 1)
        subject.touch_out("Charing Cross", 1)
        expect(subject.journey.entry_station).to eq nil
      end
    end
  end

end
