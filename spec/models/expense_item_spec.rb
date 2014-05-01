require 'spec_helper'

describe ExpenseItem do
  describe '.create_default_expense_items!' do
    let(:user) { User.create(email: 'alice@example.com', password: 'password', password_confirmation: 'password') }

    before do
      ExpenseItem.create_default_expense_items!(user)
    end

    specify do
      expect(user.expense_items.pluck(:name)).to match_array(ExpenseItem::DEFAULTS)
    end
  end
end
