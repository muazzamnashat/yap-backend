class UsersController < ApplicationController
  def create
    # binding.pry
    user = User.new(email: params[:email], password: params[:password])

    if user.save
      render json: user
    end
  end

  private
end
