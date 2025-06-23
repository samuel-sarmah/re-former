class UsersController < ApplicationController
  def new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Gives us back the hash containing the params we need to create or update a post
  def user_params
    params.expect(user: [ :email, :username, :password ])
  end
end
