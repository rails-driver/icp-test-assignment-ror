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

class Contact < ApplicationRecord
  belongs_to :company, optional: true

  with_options if: :company_id do |contact|
    contact.validates :company, presence: true
  end
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
