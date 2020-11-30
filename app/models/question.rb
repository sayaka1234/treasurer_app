class Question < ApplicationRecord
  belongs_to :history
  validates :content, presence: true
  validates :name, presence: true
end
