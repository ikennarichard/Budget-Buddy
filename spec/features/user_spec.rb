require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do
    User.create(name: "Ike", email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit new_user_session_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq groups_path
  end
end