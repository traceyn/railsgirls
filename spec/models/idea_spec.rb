require 'spec_helper'

describe Idea do

  describe "#recent?" do
    subject { idea.recent? }

    context "when the idea is less than 2 days old" do
      let(:idea) { FactoryGirl.create(:idea, created_at: Date.today) }

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
    it "fetches all the ideas with 'great idea' in the description and 'Eat Icecream' as the name" do
      idea = Idea.to_eat_icecream
      expect(Idea.great_icecream_ideas).to include(idea)
    end
  end

  # ---- TEST IDEAS ---- #
  describe '.newest' do
    it "returns the most recently added idea" do
      pending 'write this test and make it pass'
    end
  end

  describe '#short_description' do
    it "returns the description shortened to 20 characters" do
      pending 'write this test and make it pass'
    end
  end

  describe '#has_expired' do
    it "returns true if the idea has not been updated for over a year" do
      pending 'write this test and make it pass'
    end
  end

  describe '#is_important' do
    it "returns true if the idea has a '*' at the beginning of its name" do
      pending 'write this test and make it pass'
    end
  end

  # Challenges

  describe '#mark_important' do
    it "adds a '*' to the front of the idea name if an idea has a rating of 4 or more" do
      #Note: To get this to pass you will need to add the rating attribute to the idea model yourself.
      #Part of this will involve creating a database migration. Ask for help if you get stuck!
      pending 'write this test and make it pass'
    end
  end

  describe 'validations' do
    it 'validates the presence of name' do
      expect(Idea.new(name: nil)).to_not be_valid
    end

    # we want to make sure that ideas always have a description
    it 'validates the presence of description' do
      pending 'write this test and make it pass'
    end

    # What else could be check?
    # The length on the idea name
    # That we can't have two ideas with the same name
  end

end
