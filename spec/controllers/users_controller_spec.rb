require "rails_helper"

RSpec.describe UsersController, type: :controller do

	describe "GET #show" do
		before do
			@user = User.new(id:'1', email: "user@example.com")
			@user.save
			get :show, id:@user.id, format: :json
		end

		it "returns the information about user on a hash" do 
			user_response = JSON.parse(response.body, symbolize_names: true)
			expect(user_response[:email]).to eql @user.email
			expect(response.status).to eq(200)
		end
	end

end
