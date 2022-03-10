class PollChoice < ApplicationRecord
  belongs_to :poll

  validates :content, allow_blank: false
end
