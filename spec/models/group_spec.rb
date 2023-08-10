require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { create(:user) }   
  let(:group1) { create(:group, author: user) }
  
  describe 'validate attributes' do
    it 'should be valid with a name' do
      expect(group1).to be_valid
    end

    it 'should be invalid without a name' do
      group1.name = nil
      expect(group1).not_to be_valid
    end

    it 'should be invalid without an icon' do
      group1.icon = nil
      expect(group1).not_to be_valid
    end
  end

  describe 'association with sale' do
    it 'should delete sale when group is deleted' do
      sale = create(:sale, group: group1, author: user)
      group1.destroy
      expect { sale.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
