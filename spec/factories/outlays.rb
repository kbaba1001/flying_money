FactoryGirl.define do
  factory :outlay do
    amount { Faker::Number.number((3..5).to_a.sample) }
    note { Faker::Lorem.sentence.first(140) }
    user
    expense_item { ExpenseItem.all.sample }
  end
end
