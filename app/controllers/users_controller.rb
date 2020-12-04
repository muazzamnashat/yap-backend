class UsersController < ApplicationController
  def create
    # binding.pry
    user = User.new(first_name: params[:first_name], last_name: params[:last_name])

    if user.save
      render json: user
    end
  end

  private
end
