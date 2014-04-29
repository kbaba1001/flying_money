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
  expect(page).to have_content(value)
end

ならば(/^"(.*?)" と表示しないこと$/) do |value|
  expect(page).not_to have_content(value)
end
