require 'spec_helper'

describe ExpenseItem do
  describe '.create_default_expense_items!' do
    let(:user) { create(:user) }

    before do
      ExpenseItem.create_default_expense_items!(user)
    end

    specify do
      expect(user.expense_items.pluck(:name)).to match_array(ExpenseItem::DEFAULTS)
    end
  end
end
