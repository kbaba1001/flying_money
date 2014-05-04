class ExpenseItem < ActiveRecord::Base
  belongs_to :user
  has_many :outlays

  validates :name, presence: true, uniqueness: {scope: :user_id}
  validates :display_order, presence: true
  validates :user_id, presence: true

  DEFAULTS = %w(食費 交通費 会食費 教育費 娯楽費 医療費 雑費)

  scope :ordered, -> { order(:display_order) }

  class << self
    def create_default_expense_items!(user)
      DEFAULTS.each_with_index do |name, display_order|
        create!(
          name:          name,
          display_order: display_order,
          user:          user
        )
      end
    end
  end
end
