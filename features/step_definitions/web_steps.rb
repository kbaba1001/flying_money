前提(/^次のユーザーが存在する:$/) do |table|
  table.hashes.each do |hash|
    create(:user,
      email:    hash[:email],
      password: hash[:password],
    )
  end
end

前提(/^ユーザー "(.*?)" としてサインインする$/) do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end

前提(/^"(.*?)" を表示する$/) do |page_name|
  path =
    case page_name
    when 'トップページ' then root_path
    else raise ArgumentError
    end

  visit(path)
end

もし(/^"(.*?)" に "(.*?)" と入力する$/) do |label, value|
  fill_in(label, with: value)
end

もし(/^"(.*?)" をクリックする$/) do |label|
  click_on(label)
end

ならば(/^"(.*?)" と表示すること$/) do |value|
  expect(page).to have_content value
end
