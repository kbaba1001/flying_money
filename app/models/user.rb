class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :outlays
  has_many :expense_items

  validates :email, presence: true, uniqueness: true, email_format: true
  validates :password, presence: true, confirmation: true, length: {in: (8..50)}
end
