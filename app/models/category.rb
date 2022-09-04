class Category < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
end
