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

class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :email, :position
  has_one :company
end
