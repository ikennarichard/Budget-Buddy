require 'rails_helper'

RSpec.feature 'Sale', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group, author: user) }
  let!(:sales) { create_list(:sale, 3, group:, author: user) }

  it 'should display category details and transactions' do
    sign_in user

    visit group_path(group)

    expect(page).to have_content('TOTAL PAYMENT')
    expect(page).to have_content("TOTAL PAYMENT - $#{sales.sum(&:amount)}")

    sales.each do |sale|
      expect(page).to have_content(sale.name)
      expect(page).to have_content("Transaction: ##{sale.id}")
      expect(page).to have_content(sale.created_at.strftime('%d %B %Y'))
      expect(page).to have_content(sale.created_at.strftime('%H:%M:%p'))
      expect(page).to have_content("$#{sale.amount}")
    end

    within '.custom-btn' do
      expect(page).to have_link('add transaction'.upcase!, href: new_sale_path(group_id: group.id))
    end
  end

  it 'should add a new transaction to a category' do
    sign_in user

    visit new_sale_path(group_id: group.id)

    fill_in 'sale_name', with: 'New Transaction'
    fill_in 'sale_amount', with: 100.0
    select group.name, from: 'sale_group_id'

    click_button 'SAVE'

    expect(page).to have_content('New Transaction')
    expect(page).to have_content('$100.0')
  end
end
