class Poll < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :title, allow_blank: false
end
