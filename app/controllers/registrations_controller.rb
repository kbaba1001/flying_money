class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      ExpenseItem.create_default_expense_items!(user)
    end
  end
end
