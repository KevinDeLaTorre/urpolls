class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :polls, dependent: :destroy
  has_many :poll_choices, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
end
