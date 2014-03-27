require 'spec_helper'

feature "Creating an idea" do

  before(:all) do
    @user = FactoryGirl.create(:user)
    @idea = FactoryGirl.create(:idea, :with_picture)
  end

  after(:all) do
    User.destroy_all
    Idea.destroy_all
  end

  scenario "signing in with the correct details and creating an idea", js: true do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      sleep 1
    end
    click_button 'Sign in'
    expect(page).to have_content "Logged in as #{@user.email}"
    sleep 1
    visit '/ideas'
    expect(page).to have_content 'Ideas'
    sleep 1
    click_link 'Show'
    expect(page).to have_content @idea.name
    sleep 1
    expect(page).to have_selector("img[src$='#{@idea.picture_url}']")
  end

end

feature "Editing an idea", js: true do
  before(:all) do
    @user = FactoryGirl.create(:user)
    @idea = FactoryGirl.create(:idea, :with_picture)
  end

  after(:all) do
    User.destroy_all
    Idea.destroy_all
  end

  scenario "signing in with the correct details and editing an idea", js: true do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      sleep 1
    end
    click_button 'Sign in'
    expect(page).to have_content "Logged in as #{@user.email}"
    sleep 1
    visit '/ideas'
    expect(page).to have_content 'Ideas'
    sleep 1
    click_link 'Edit'
    expect(page).to have_content 'Editing idea'
    sleep 1
    within('.edit_idea') do
      fill_in 'idea_name', with: 'The worst idea ever'
      sleep 1
    end
    click_button 'Update Idea'
    expect(page).to have_content 'The worst idea ever'
    sleep 1
  end
end


