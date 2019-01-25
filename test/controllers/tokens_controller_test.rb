require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  test 'should return valid token' do
    post tokens_url, as: :json
    assert_response :success
  end
end
