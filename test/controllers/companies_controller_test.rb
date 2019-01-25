require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create(:company)
    @headers = {
      'Authorization' => "Bearer #{JWTTokenService.encode(ext: 5.minutes.to_i)}"
    }
  end

  test 'should get index' do
    get companies_url, headers: @headers, as: :json
    assert_response :success
  end

  test 'shoud assert all companies' do
    get companies_url, headers: @headers, as: :json
    assert_equal Company.all, assigns(:companies)
  end

  test 'should create company' do
    params = attributes_for(:company)

    assert_difference('Company.count') do
      post companies_url, headers: @headers, params: { company: params }, as: :json
    end

    assert_response 201
  end

  test 'should show company' do
    get company_url(@company), headers: @headers, as: :json
    assert_response :success
    assert_equal Company.find(@company.id), assigns(:company)
  end

  test 'should update company' do
    patch company_url(@company), params: { company: attributes_for(:company) }, headers: @headers, as: :json
    assert_response 200
  end

  test 'should destroy company' do
    assert_difference('Company.count', -1) do
      delete company_url(@company), headers: @headers, as: :json
    end

    assert_response 204
    assert_nil Company.find_by(id: @company.id)
  end
end
