class User < ApplicationRecord
  has_many :sales, foreign_key: :author_id, dependent: destroy
  has_many :groups, foreign_key: :author_id, dependent: destroy
end
