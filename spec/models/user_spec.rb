require 'spec_helper'

describe User do
  describe '#total_amount' do
    let(:user)       { create(:user) }
    let(:other_user) { create(:user) }

    before do
      create(:outlay, user: user, amount: 1000)
      create(:outlay, user: user, amount: 500)

      create(:outlay, user: other_user, amount: 300)
    end

    specify do
      expect(user.total_amount).to eq(1500)
    end

    specify do
      expect(other_user.total_amount).to eq(300)
    end
  end
end
