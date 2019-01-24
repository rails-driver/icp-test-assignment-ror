# == Schema Information
#
# Table name: claims
#
#  id                       :integer          not null, primary key
#  price_drop               :integer          default(0)
#  percentage_drop          :integer          default(0)
#  status                   :integer          default(1)
#  cap_drop                 :integer          default(0)
#  company_id               :integer
#  traded_inflation         :integer          default(0)
#  signed_losses            :integer          default(0)
#  total_potential_income   :integer          default(0)
#  current_potential_income :integer          default(0)
#  data_provided            :text
#  likely_bookbuild         :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class ClaimTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
