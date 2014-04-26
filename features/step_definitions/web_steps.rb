前提(/^次のユーザーが存在する:$/) do |table|
  table.hashes.each do |hash|
    create(:user,
      email:    hash[:email],
      password: hash[:password],
    )
  end
end

前提(/^ユーザー "(.*?)" でログインする$/) do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

もし(/^"(.*?)" に "(.*?)" と入力する$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

もし(/^"(.*?)" をクリックする$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

ならば(/^次の表を表示すること:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
