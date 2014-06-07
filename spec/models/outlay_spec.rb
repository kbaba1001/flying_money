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

  describe '.monthly_amounts' do
    let(:user) { create(:user) }

    before do
      create(:outlay, amount: 10000, created_at: Date.parse('2013/05/01'), user: user)
      create(:outlay, amount:  1000, created_at: Date.parse('2013/05/01'), user: user)
      create(:outlay, amount:  2000, created_at: Date.parse('2013/05/15'), user: user)
      create(:outlay, amount:  5000, created_at: Date.parse('2013/05/31'), user: user)

      create(:outlay, amount:  2000, created_at: Date.parse('2013/04/01'), user: user)
      create(:outlay, amount:  2000, created_at: Date.parse('2013/04/30'), user: user)
    end

    subject { user.outlays.monthly_amounts }

    it do
      should include(
        '2013/05' => 18000,
        '2013/04' => 4000
      )
    end
  end
end
