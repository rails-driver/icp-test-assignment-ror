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

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :email, :website
end
