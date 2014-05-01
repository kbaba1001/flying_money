FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation { password }

    after(:create) do |user|
      ExpenseItem.create_default_expense_items!(user)
    end
  end
end
