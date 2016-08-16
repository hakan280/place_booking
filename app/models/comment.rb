class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :place

  validates :body , presence: true
end
