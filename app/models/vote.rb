class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll_choice
  belongs_to :poll

  validates :user, presence: true
  validates :poll_choice, presence: true
  validates :poll, presence: true

  validates_uniqueness_of :user, scope: [:poll]

end
