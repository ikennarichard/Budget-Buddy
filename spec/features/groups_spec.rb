require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  let(:user) { create(:user) }

  it 'should display categories when user is signed in and has permission' do
    sign_in user
    group = create(:group, author: user)

    visit groups_path
    within '.list-unstyled' do
      expect(page).to have_content(group.name.capitalize)
      expect(page).to have_content(group.created_at.strftime('%d %B %Y'))
      expect(page).to have_content("$#{group.sales.sum(:amount)}")
    end
    within '.add-category' do
      expect(page).to have_link('add category'.upcase!, href: new_group_path)
    end
  end

  it 'should display "No category added yet" when no categories are present' do
    sign_in user
    visit groups_path
    expect(page).to have_content('No category added yet, click add category')
  end

  it 'should not display groups when user is not signed in' do
    visit groups_path

    expect(page).not_to have_selector('.list-unstyled')
  end

  it 'should add a new category and redirect to groups page' do
    sign_in user
    create(:group, author: user)

    visit groups_path

    within '.add-category' do
      click_link 'add category'.upcase!
    end
    expect(page).to have_current_path(new_group_path)
    fill_in 'group_name', with: 'New category'
    fill_in 'group_icon', with: 'pic-1.jpg'
    click_button 'SAVE'
    expect(page).to have_content('Category was added successfully.')
    expect(page).to have_content('New category')
    expect(page).to have_css('.icon-image')
    expect(current_path).to eq groups_path
  end
end
