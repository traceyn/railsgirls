require 'spec_helper'

describe IdeasController do
  describe "PATCH update" do
    let(:idea) { FactoryGirl.create(:idea, :with_picture) }
    subject { patch :update, id: idea.id, idea: idea_params }

    context "with valid params" do
      let(:idea_params) { {name: 'This idea is better'} }

      it "redirects to the idea show page" do
        expect(subject).to redirect_to idea
      end

      it "updates the idea" do
        expect { subject }.to change { idea.reload.name }
      end
    end

    context "with invalid params" do
      let(:idea_params) { {name: ''} }

      it "renders the new template" do
        expect(subject).to render_template(:edit)
      end

      it "doesn't update the idea" do
        expect { subject }.to_not change { idea.reload.name }
      end
    end
  end

  describe "POST icecream" do
    subject(:request){ post :icecream }

    it 'redirects to index page' do
      expect(request).to redirect_to ideas_path
    end

    it 'creates a new icecream idea' do
      expect(Idea.great_icecream_ideas.count).to eq 0
      request
      expect(Idea.great_icecream_ideas.count).to eq 1
    end
  end
end
