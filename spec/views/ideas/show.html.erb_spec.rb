require 'spec_helper'

describe "ideas/show" do
  before do
    @idea = FactoryGirl.create(:idea)
    render
  end

  it("renders the show template") do
  	expect(view).to render_template('show')
  do
  	
  it "contains the idea attributes" do
  	expect(rendered).to have_content(@idea.description)
  end

end
