前提(/^次のユーザーが存在する:$/) do |table|
  table.hashes.each do |hash|
    attrs = {email: hash[:email]}
    attrs[:password] = hash[:password] if hash[:password]

    create(:user, attrs)
  end
end

前提(/^ユーザー "(.*?)" としてサインインする$/) do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end
