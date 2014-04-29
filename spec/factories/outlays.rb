# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :outlay do
    amount 1000
    note '昼飯代'
    user
  end
end
