require 'spec_helper'

describe "ideas/show" do
  before do
    @idea = FactoryGirl.create(:idea)
    render
  end

  it("renders the show template") {expect(view).to render_template('show')}
  it("contains the idea attributes") {expect(rendered).to have_content(@idea.description)}
end
