class Poll < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
