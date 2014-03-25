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

end
