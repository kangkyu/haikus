class UsersController < ApplicationController

	def serialize_model(model, options = {})
		options[:is_collection] = false
		JSONAPI::Serializer.serialize(model, options)
	end

	def show
		user =  User.find(params[:id])
		render json: serialize_model(user)
	end

end
