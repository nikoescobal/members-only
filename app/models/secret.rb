class Secret < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, :body, length: { minimum: 10 }
  belongs_to :user
end
