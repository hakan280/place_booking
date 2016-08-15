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

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
