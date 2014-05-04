class Outlay < ActiveRecord::Base
  belongs_to :user
  belongs_to :expense_item

  validates :amount, presence: true, length: {maximum: 10}
  validates :expense_item_id, presence: true
  validates :note, length: {maximum: 140}
  validates :user_id, presence: true

  scope :group_by_months, -> {
    where.not(id: nil)
      .includes(:expense_item)
      .group_by {|outlay| outlay.created_at.beginning_of_month }
  }
end
