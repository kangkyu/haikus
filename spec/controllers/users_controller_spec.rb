require "rails_helper"

RSpec.describe UsersController, type: :controller do

	describe "GET #show" do
		before do
			@user = User.create(id: 1 , email: "user@example.com")
			get :show, id:@user.id
		end

		it "returns the information about user on a hash" do 
			user_response = JSON.parse(response.body)
			expect(user_response['data']['attributes']['email']).to eql @user.email
			expect(response.status).to eq(200)
		end
	end
end