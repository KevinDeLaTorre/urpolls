class Poll < ApplicationRecord
  before_save :process_title

  belongs_to :user
  has_many :poll_choices, dependent: :destroy

  validates :title, presence: true, allow_blank: false

  private

  def process_title
    self.title = self.title.capitalize
  end
end
