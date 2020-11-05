require './test/test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @password = "password"
    @confirmed_user = User.create(email: "#{rand(50000)}@example.com", 
                                  password: @password, 
                                 )
    sign_in students(:one)
    # @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    post companies_url, params: { company: {:name => "Company1", :country => "India" } }
    assert_redirected_to companies_url
  end

end