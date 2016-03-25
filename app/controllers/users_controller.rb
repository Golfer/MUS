class UsersController < ApplicationController
  # before_filter :set_user, only: %i(show edit update)
  # before_filter :validate_authorization_for_user, only: %i(edit update)

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email)
  end
end
