もし(/^"(.*?)" の削除リンクをクリックする$/) do |name|
  expense_item = ExpenseItem.find_by!(name: name)

  click_link("remove_expense_item_#{expense_item.id}")
end
