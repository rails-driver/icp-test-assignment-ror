# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           default("")
#  address    :string           default("")
#  phone      :string           default("")
#  email      :string           default("")
#  position   :string           default("")
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    position { Faker::Job.position }
    phone { Faker::PhoneNumber.phone_number }
    company
  end
end
