前提(/^"(.*?)" が次の支出を登録している:$/) do |email, table|
  user = User.find_by(email: email)

  table.hashes.each do |hash|
    attrs = {}
    attrs[:expense_item] = ExpenseItem.find_by!(name: hash['費目'])
    attrs[:amount]       = hash['金額']
    attrs[:note]         = hash['メモ'] if hash['メモ']
    attrs[:created_at]   = Date.parse(hash['登録日']) if hash['登録日']

    user.outlays.create!(attrs)
  end
end

もし(/^費目の設定ボタンをクリックする$/) do
  find('#expense_item_setting').click
end
