require 'test_helper'

class ClaimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create(:company)
    @claim = create(:claim, company: @company)
  end

  test 'should get index' do
    get company_claims_url(@company), as: :json
    assert_response :success
  end

  test 'should create claim' do
    assert_difference('Claim.count') do
      post company_claims_url(@company), params: { claim: attributes_for(:claim) }, as: :json
    end

    assert_response 201
  end

  test 'should show claim' do
    get company_claim_url(@company, @claim), as: :json
    assert_response :success
  end
end
