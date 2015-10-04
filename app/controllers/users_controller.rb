class UsersController < ApplicationController

	def serialize_model(model, options = {})
		options[:is_collection] = false
		JSONAPI::Serializer.serialize(model, options)
	end

	def show
		user =  User.find(params[:id])
		render json: serialize_model(user)
	end

	def create
		user = User.new(user_params)
		if user.save
			render json: serialize_model(user), status: 201
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def update
		user = User.find(params[:id])

		if user.update(user_params)
			render json: serialize_model(user), status: 200
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		head 204
	end

private

	def user_params
		params.require(:user).permit(:email)
	end

end
