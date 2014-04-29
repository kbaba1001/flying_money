class Outlay < ActiveRecord::Base
  belongs_to :user

  validates :amount, presence: true, length: {maximum: 10}
  validates :user_id, presence: true
  validates :note, length: {maximum: 140}
end
