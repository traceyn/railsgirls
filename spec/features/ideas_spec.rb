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
    end
    click_button 'Sign in'
    expect(page).to have_content "Logged in as #{@user.email}"
    visit '/ideas'
    expect(page).to have_content 'Ideas'
    click_link 'Show'
    expect(page).to have_content @idea.name
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
    end
    click_button 'Sign in'
    expect(page).to have_content "Logged in as #{@user.email}"
    visit '/ideas'
    expect(page).to have_content 'Ideas'
    click_link 'Edit'
    expect(page).to have_content 'Editing idea'
    within('.edit_idea') do
      fill_in 'idea_name', with: 'The worst idea ever'
    end
    click_button 'Update Idea'
    expect(page).to have_content 'The worst idea ever'
  end
end

#discussion points:
#examples of failure scenarios?
#other examples?
#should these tests be broken down more?
#is there too much repetition?

#pros
#easy to read
#easy for a human to understand
#look cool

#cons
#these tests can be slow to run once you have a lot of them
#can be difficult to troubleshoot
#should have corresponding unit tests
#these test are very fragile, what if you change the text on a button etc?

#a lot of this is subjective


