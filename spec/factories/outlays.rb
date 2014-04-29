# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :outlay do
    amount 1
    note "MyString"
    user nil
  end
end
