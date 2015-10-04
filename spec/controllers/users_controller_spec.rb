require "rails_helper"

RSpec.describe UsersController, type: :controller do

	describe "GET #index" do
		before do
			@user1 = User.create(id: 1 , email: "user1@example.com")
			@user2 = User.create(id: 2 , email: "user2@example.com")
			get :index
		end

		it "returns the all user informations on a hash" do 
			user_response = json_response
			expect(user_response[:data][0][:attributes][:email]).to eql @user1.email
			expect(user_response[:data][1][:attributes][:email]).to eql @user2.email
			expect(response.status).to eq(200)
		end
	end


	describe "GET #show" do
		before do
			@user = User.create(id: 1 , email: "user@example.com")
			get :show, id:@user.id
		end

		it "returns the information about user on a hash" do 
			user_response = json_response
			expect(user_response[:data][:attributes][:email]).to eql @user.email
			expect(response.status).to eq(200)
		end
	end

	describe "POST #create" do
		context "when is successfully created" do
			before do
				@user = {email: "user@example.com"}
				post :create, { user: @user}
			end

			it "renders the json message for the user just created" do
				user_response = json_response
				expect(user_response[:data][:attributes][:email]).to eql @user[:email]
				expect(response.status).to eq(201)
			end
		end

		context "when user is not created" do
			before do
				@wrong_user_email = { email: ""}
				post :create, { user: @wrong_user_email}
			end

			it "renders an errors json" do
				user_response = JSON.parse(response.body, symbolize_names: true)
				expect(user_response).to have_key(:errors)
				expect(response.status).to eq(422)
			end

			it "renders the json errors messages when blank" do
				user_response = json_response
				expect(user_response[:errors][:email]).to include "can't be blank"
			end
		end
	end

	describe "PUT/PATCH #update" do

		context "when update is successful" do
			before do
				@user = User.create(id: 1 , email: "user@example.com")
				patch :update, { id: @user.id, user: {email: "newuser@example.com"}}
			end

			it "renders the json message for the user just updated" do
				user_response = json_response
				expect(user_response[:data][:attributes][:email]).to eql "newuser@example.com"
				expect(response.status).to eq(200)
			end
		end

		context "when user is not updated" do
			before do
				@wrong_user_email = { email: "foo@example,com"}
				post :create, { user: @wrong_user_email}
			end

			it "renders an errors json" do
				user_response = JSON.parse(response.body, symbolize_names: true)
				expect(user_response).to have_key(:errors)
				expect(response.status).to eq(422)
			end

			it "renders the json errors messages when blank" do
				user_response = json_response
				expect(user_response[:errors][:email]).to include "is invalid"
			end
		end
	end

	describe "Delete #destroy" do

		before do
			@user = User.create(id: 1 , email: "user@example.com")
			delete :destroy, { id: @user.id}
		end
		
		it "renders the 204 status rsponse" do
			expect(response.status).to eq(204)
		end
	end	
end