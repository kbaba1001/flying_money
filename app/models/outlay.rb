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
      .order(created_at: :desc)
      .group_by {|outlay| outlay.created_at.beginning_of_month }
  }

  scope :amounts_by_expense_item, ->(date) {
    where('? <= outlays.created_at AND outlays.created_at < ?',
      date.beginning_of_month, date.next_month.beginning_of_month)
    .joins(:expense_item).group(:name).sum(:amount)
  }

  scope :monthly, -> (date) {
    where('? <= outlays.created_at AND outlays.created_at < ?',
      date.beginning_of_month, date.next_month.beginning_of_month)
    .includes(:expense_item)
    .order(created_at: :desc)
  }
end
