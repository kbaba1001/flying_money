前提(/^"(.*?)" ページを表示する$/) do |page_name|
  path =
    case page_name
    when 'トップ'       then root_path
    when 'サインアップ' then new_user_registration_path
    else raise ArgumentError
    end

  visit(path)
end

もし(/^"(.*?)" に "(.*?)" と入力する$/) do |label, value|
  fill_in(label, with: value)
end

もし(/^"(.*?)" として "(.*?)" を選択する$/) do |label, choice|
  select(choice, from: label)
end

もし(/^"(.*?)" をクリックする$/) do |label|
  click_on(label)
end

もし(/^"(.*?)" ボタンをクリックする$/) do |label|
  click_button(label)
end

ならば(/^(?:"(.*?)" に )?"([^"]*?)" と表示すること$/) do |parent, value|
  selector =
    case parent
    when '支出一覧' then '#outlay_list'
    else 'body'
    end

  within(selector) do
    expect(page).to have_content(value)
  end
end

ならば(/^"(.*?)" フィールドに "(.*?)" と表示すること$/) do |label, value|
  expect(find_field(label).value).to eq(value)
end

ならば(/^"(.*?)" と表示しないこと$/) do |value|
  expect(page).not_to have_content(value)
end

もし(/^全ての Tooltips を開く$/) do
  find('.has-tip').trigger(:mouseover)
end
