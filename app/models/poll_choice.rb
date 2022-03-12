class PollChoice < ApplicationRecord
  before_save :process_content

  belongs_to :poll

  validates :content, presence: true, allow_blank: false

  def reset_count
    self.count = 0
  end

  private

  def process_content
    self.content = self.content.capitalize
  end
end
