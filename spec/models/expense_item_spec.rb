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

  describe '#set_default_display_order!' do
    let(:user) { User.create(email: 'alice@example.com', password: 'password', password_confirmation: 'password') }
    let(:expense_item) { user.expense_items.build }

    context 'ユーザーに紐づく費目がないとき' do
      specify do
        expect {
          expense_item.set_default_display_order!
        }.to change {
          expense_item.display_order
        }.from(nil).to(1)
      end
    end

    context 'ユーザーに紐づくいくつかの費目が存在するとき' do
      before do
        user.expense_items.create(name:   '食費', display_order: 1)
        user.expense_items.create(name: '交通費', display_order: 2)
        user.expense_items.create(name: '会食費', display_order: 3)
      end

      specify do
        expect {
          expense_item.set_default_display_order!
        }.to change {
          expense_item.display_order
        }.from(nil).to(4)
      end
    end
  end
end
