class Outlay < ActiveRecord::Base
  belongs_to :user
  belongs_to :expense_item

  validates :amount, presence: true, length: {maximum: 10}
  validates :expense_item_id, presence: true
  validates :note, length: {maximum: 140}
  validates :user_id, presence: true

  scope :monthly, -> (date) {
    where('? <= outlays.created_at AND outlays.created_at < ?',
      date.beginning_of_month, date.next_month.beginning_of_month)
    .includes(:expense_item)
    .order(created_at: :desc)
  }

  class << self
    def monthly_amounts
      group("to_char(created_at, 'YYYY/MM')").order("to_char(created_at, 'YYYY/MM') DESC").sum(:amount)
    end
  end
end
