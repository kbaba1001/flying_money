class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :outlays
  has_many :expense_items

  after_create :create_default_expense_items

  def total_amount
    outlays.sum(:amount)
  end

  private

  def create_default_expense_items
    ExpenseItem::DEFAULTS.each_with_index do |name, display_order|
      ExpenseItem.create!(
        name:          name,
        display_order: display_order,
        user:          self
      )
    end
  end
end
