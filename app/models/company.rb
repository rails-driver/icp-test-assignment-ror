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

class Company < ApplicationRecord
  has_one :contact
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :claims, dependent: :restrict_with_exception
end
