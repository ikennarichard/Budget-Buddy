class User < ApplicationRecord
  has_many :entities, foreign_key: :author_id, dependent: destroy
  has_many :groups, dependent: destroy
  validates :name, prescence: true
end
