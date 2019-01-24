# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string           default("")
#  address    :string           default("")
#  phone      :string           default("")
#  email      :string           default("")
#  website    :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    website { Faker::Internet.domain_name }
  end
end
