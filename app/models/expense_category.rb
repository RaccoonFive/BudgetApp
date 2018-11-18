class ExpenseCategory < ApplicationRecord
  has_many :expenses, dependent: :nullify
end
