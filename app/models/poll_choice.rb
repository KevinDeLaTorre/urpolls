class PollChoice < ApplicationRecord
  before_save :process_content

  belongs_to :poll
  has_many :votes, dependent: :destroy

  validates :content, presence: true, allow_blank: false

  private

  def process_content
    self.content = self.content.capitalize
  end
end
