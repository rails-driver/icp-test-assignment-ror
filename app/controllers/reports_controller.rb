class ReportsController < ApplicationController
  include Companies

  def show
    file = CSV.generate do |csv|
      csv << Claim.csv_columns
      @company.claims.each do |claim|
        csv << claim.to_csv
      end
    end
    send_data file, type: 'text/csv', disposition: 'inline', filename: filename
  end

  private

  def filename
    "#{Time.zone.now.strftime('%Y-%m-%d %H:%M')}.csv"
  end
end
