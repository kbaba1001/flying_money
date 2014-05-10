require 'spec_helper'

describe OutlayDecorator do
  describe '#display_amount' do
    subject { outlay.display_amount }

    context 'メモがないとき' do
      let(:outlay) { create(:outlay, amount: 1000, note: '').decorate }

      it { should eq('1,000円') }
    end

    context 'メモがあるとき' do
      let(:outlay) { create(:outlay, amount: 1000, note: '昼飯代').decorate }

      it { should have_tag('span.has-tip', with: {'data-tooltip' => '', title: '昼飯代'}, text: '1,000円') }
    end
  end
end
