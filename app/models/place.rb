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
end
