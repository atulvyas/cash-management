require './test/test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    post new_user_session_url, params: {user: {:email => "atul@webkorps.com", :password => "webkorps"}}
    @company = companies(:one)
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

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { :name => "Company11", :country => "India"  } }
    assert_redirected_to companies_url
  end

  test "should destroy company" do
    delete company_url(@company)
    assert_redirected_to companies_url
  end
end