class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, :amount, presence: true
end
