require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = create(:contact)
    @headers = {
      'Authorization' => "Bearer #{JWTTokenService.encode(ext: 5.minutes.to_i)}"
    }
  end

  test 'should get index' do
    get contacts_url, headers: @headers, as: :json
    assert_response :success
  end

  test 'should return all contacts' do
    get contacts_url, headers: @headers, as: :json
    assert_equal Contact.all, assigns(:contacts)
  end

  test 'should create contact' do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: attributes_for(:contact) }, headers: @headers, as: :json
    end

    assert_response 201
  end

  test 'should show contact' do
    get contact_url(@contact), headers: @headers, as: :json
    assert_response :success
  end

  test 'should update contact' do
    patch contact_url(@contact), params: { contact: attributes_for(:contact) }, headers: @headers, as: :json
    assert_response 200
  end

  test 'should destroy contact' do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact), headers: @headers, as: :json
    end

    assert_response 204
  end

  test 'should link contact to company' do
    post company_contact_url(@contact, params: {
                               contact: {
                                 company_id: create(:company).id
                               }
                             }), headers: @headers, as: :json
    assert_response 200
  end
end
