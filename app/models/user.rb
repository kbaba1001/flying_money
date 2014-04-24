class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { in: (4..30) }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
end
