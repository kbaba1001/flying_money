前提(/^"(.*?)" が次の支出を登録している:$/) do |email, table|
  user = User.find_by(email: email)

  table.hashes.each do |hash|
    user.outlays.create!(
      amount: hash['金額'],
      note:   hash['備考'],
    )
  end
end
