class ExpenseItem < ActiveRecord::Base
  belongs_to :user
  has_many :outlays

  validates :name, presence: true, uniqueness: {scope: :user_id}
  validates :display_order, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :user_id, presence: true

  before_validation :set_default_display_order!, if: 'display_order.blank?'

  DEFAULTS = %w(食費 交通費 会食費 教育費 娯楽費 医療費 雑費)

  scope :ordered, -> { order(:display_order) }

  class << self
    def create_default_expense_items!(user)
      DEFAULTS.each.with_index(1) do |name, display_order|
        create!(
          name:          name,
          display_order: display_order,
          user:          user
        )
      end
    end
  end

  def set_default_display_order!
    return unless user

    self.display_order = ExpenseItem.where(user: user).maximum(:display_order).to_i + 1
  end
end
