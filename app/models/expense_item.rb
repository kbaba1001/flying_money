class ExpenseItem < ActiveRecord::Base
  belongs_to :user
  has_many :outlays
end
