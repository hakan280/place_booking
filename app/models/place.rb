# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string
#  address        :text
#  phone_number   :string
#  established_at :date
#  contact_mail   :string
#  city           :string
#  description    :text
#  category_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Place < ApplicationRecord
  belongs_to :category
  belongs_to :customer

  validates :name , presence: true
  validates :description, length: {minimum: 5}
  validates :city, presence: true
  validates :contact_mail, format: {with: /\A.+@.+\z/}


end
