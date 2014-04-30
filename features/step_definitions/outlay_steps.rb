前提(/^"(.*?)" が次の支出を登録している:$/) do |email, table|
  user = User.find_by(email: email)

  table.hashes.each do |hash|
    expense_item = ExpenseItem.find_by!(name: hash['費目'])

    user.outlays.create!(
      expense_items: expense_item,
      amount:        hash['金額'],
      note:          hash['備考'],
    )
  end
end
