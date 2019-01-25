require 'test_helper'

class ClaimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claims = create_list(:claim, 10, company: create(:company))
    @company = create(:company)
    @claim = create(:claim, company: @company)
    @headers = {
      'Authorization' => "Bearer #{JWTTokenService.encode(ext: 5.minutes.to_i)}"
    }
  end

  test 'should get index' do
    get company_claims_url(@company), headers: @headers, as: :json
    assert_response :success
  end

  test 'should create claim' do
    assert_difference('@company.claims.count') do
      post company_claims_url(@company), headers: @headers, params: { claim: attributes_for(:claim) }, as: :json
    end

    assert_response 201
  end

  test 'should show claim' do
    get company_claim_url(@company, @claim), headers: @headers, as: :json
    assert_response :success
  end

  test 'should return 404' do
    get company_claim_url(0, @claim), headers: @headers, as: :json
    assert_response 404
  end

  test 'should return 404 for companies claim' do
    get company_claim_url(@company, @claims.last), headers: @headers, as: :json
    assert_response 404
  end
end
