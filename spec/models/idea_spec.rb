require 'spec_helper'

describe Idea do

  describe "#recent?" do
    subject { idea.recent? }

    context "when the idea is less than 2 days old" do
      let(:idea) { FactoryGirl.create(:idea) }

      it "returns true" do
        expect(subject).to eq true
      end
    end

    context "when the idea is more than 2 days old" do
      let(:idea) { FactoryGirl.create(:idea, created_at: Date.today - 1.month) }

      it "returns false" do
        expect(subject).to eq false
      end
    end
  end

  describe '.to_eat_icecream' do
    it "sets the name and description of an idea" do
      idea = Idea.to_eat_icecream
      expect(idea.name).to eq "Eat Icecream"
      expect(idea.description).to eq "Yum! That's a great idea"
    end
  end

  describe '.great_icecream_ideas' do
    it "fetches all the ideas with 'great idea' in the description
        and 'Eat Icecream' as the name" do
      idea = Idea.to_eat_icecream
      expect(Idea.great_icecream_ideas).to include(idea)
    end
  end
end
