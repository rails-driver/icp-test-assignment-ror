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

class Claim < ApplicationRecord
  belongs_to :company

  enum status: {
    inactive: 0,
    active: 1
  }

  def self.csv_columns
    Claim.column_names.map(&:to_sym).reject do |column|
      %i[id updated_at created_at].include?(column)
    end
  end

  def to_csv
    slice(*Claim.csv_columns).values
  end
end
