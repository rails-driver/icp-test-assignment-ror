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

BOTTOM = 0
TOP = 100
FactoryBot.define do
  factory :claim do
    price_drop { rand(BOTTOM..TOP) }
    percentage_drop { rand(BOTTOM..TOP) }
    status { Claim.statuses.keys.sample }
    company
    total_potential_income { rand(BOTTOM..TOP) }
    signed_losses { rand(BOTTOM..TOP) }
    traded_inflation { rand(BOTTOM..TOP) }
    current_potential_income { rand(BOTTOM..TOP) }
    data_provided { Faker::Lorem.paragraph }
    likely_bookbuild { Faker::Lorem.paragraph }
  end
end
