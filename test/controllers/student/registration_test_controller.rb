require 'rails_helper'
describe RegistrationController, type: :controller do

  describe "GET #create" do
    context "Create student(sign up)" do
      it "return http success" do
        get new_user_registration_url, params: { user: { email: 'test_user@gmail.com', password: '123456789', confirmation_password: '123456789' } 
        expect(response).to have_http_status(:success)
      end
    end
  end
end