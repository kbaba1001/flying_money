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
    ExpenseItem.create_default_expense_items!(self)
  end
end
