class PollChoice < ApplicationRecord
  belongs_to :poll

  validates :content, uniqueness: { allow_blank: false }
end
