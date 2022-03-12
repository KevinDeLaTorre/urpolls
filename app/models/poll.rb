class Poll < ApplicationRecord
  belongs_to :user
  has_many :poll_choices, dependent: :destroy

  validates :title, uniqueness: { allow_blank: false }
end
