class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  redirect_authenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(permited_params)

    if @user.save
      redirect_to root_path
    else
      render partial: "form", locals: { model: @user }, status: :unprocessable_entity
    end
  end

  private

  def permited_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
