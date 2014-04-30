class ExpenseItem < ActiveRecord::Base
  belongs_to :user
  has_many :outlays

  DEFAULTS = %w(食費 交通費 会食費 教育費 娯楽費 医療費 雑費)
end
