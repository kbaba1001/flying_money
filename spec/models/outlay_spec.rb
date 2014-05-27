require 'spec_helper'

describe Outlay do
  describe '.monthly' do
    let(:user) { create(:user) }

    let(:outlay_0501) { create(:outlay, created_at: Date.parse('2013/05/01'), amount: 10000, user: user) }
    let(:outlay_0531) { create(:outlay, created_at: Date.parse('2013/05/31'), amount: 20000, user: user) }
    let(:outlay_0601) { create(:outlay, created_at: Date.parse('2013/06/01'), amount:  1000, user: user) }

    subject { user.outlays.monthly(Date.parse('2013/05/01')) }

    it { should include(outlay_0501, outlay_0531) }
    it { should_not include(outlay_0601) }
  end

  describe '.amounts_by_expense_item' do
    let(:user) { create(:user) }

    let(:food_expense)      { user.expense_items.find_by(name: '食費')   }
    let(:traveling_expense) { user.expense_items.find_by(name: '交通費') }
    let(:amusement_expense) { user.expense_items.find_by(name: '娯楽費') }

    before do
      create(:outlay, expense_item: food_expense,      amount: 10000, created_at: Date.parse('2013/05/01'), user: user)
      create(:outlay, expense_item: food_expense,      amount:  1000, created_at: Date.parse('2013/05/01'), user: user)
      create(:outlay, expense_item: traveling_expense, amount:  2000, created_at: Date.parse('2013/05/15'), user: user)
      create(:outlay, expense_item: amusement_expense, amount:  5000, created_at: Date.parse('2013/05/31'), user: user)

      create(:outlay, expense_item: food_expense,      amount:  2000, created_at: Date.parse('2013/04/01'), user: user)
      create(:outlay, expense_item: traveling_expense, amount:  2000, created_at: Date.parse('2013/04/30'), user: user)
    end

    subject { user.outlays.amounts_by_expense_item(date) }

    context '5月の費目毎の合計値' do
      let(:date) { Date.parse('2013/05/01') }

      it do
        should include(
          '食費'   => 11000,
          '交通費' =>  2000,
          '娯楽費' =>  5000,
        )
      end
    end

    context '4月の費目毎の合計値' do
      let(:date) { Date.parse('2013/04/01') }

      it do
        should include(
          '食費'   => 2000,
          '交通費' => 2000,
        )
      end
    end
  end
end
