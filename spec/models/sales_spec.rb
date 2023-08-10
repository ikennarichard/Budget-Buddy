require 'rails_helper'

RSpec.describe Sale, type: :model do
  let(:user) { create(:user) }   
  let(:group1) { create(:group, author: user) }
  let(:sale1) {create(:sale, author:user, group: group1)}
  
  describe 'validate attributes' do
    it 'should be valid with a name' do
      expect(sale1).to be_valid
    end

    it 'should be invalid without a name' do
      sale1.name = nil
      expect(sale1).not_to be_valid
    end

    it 'should be invalid without an amount' do
      sale1.amount = nil
      expect(sale1).not_to be_valid
    end
  end

  describe 'association' do
    it { should belong_to(:group).class_name('Group') }
  end
end
