class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :sales, dependent: :destroy
  validates :name, uniqueness: true, presence: true 
  validates :icon, presence: true
end
