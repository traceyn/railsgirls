require 'spec_helper'

describe "ideas/new" do
  before do
    @idea = Idea.new
    render
  end

  it("renders the new template") {expect(view).to render_template('new')}
  it("renders the form partial") {expect(view).to render_template(partial: '_form')}
end
