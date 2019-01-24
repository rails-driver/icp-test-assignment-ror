require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create(:company)
  end

  test 'should get csv file' do
    get company_report_url(@company)
    assert_equal(response.headers['Content-Type'], 'text/csv')
  end

  test 'csv filename should be today date with time' do
    get company_report_url(@company)

    filename = "#{Time.zone.now.strftime('%Y-%m-%d %H:%M')}.csv"
    assert(response.headers['Content-Disposition'].include?(filename))
  end
end
