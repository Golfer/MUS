class UsersController < ApplicationController
  # before_filter :set_user, only: %i(show edit update destroy)
  # before_filter :validate_authorization_for_user, only: %i(edit update)

  # def index
  # end
  #
  # def show
  # end
  #
  # def edit
  # end
  #
  # def update
  #   # authorize! :update, @user
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       sign_in(@user == current_user ? @user : current_user, :bypass => true)
  #       format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # GET/PATCH /users/:id/finish_signup
  # def finish_signup
  #   # authorize! :update, @user
  #   if request.patch? && params[:user] #&& params[:user][:email]
  #     if @user.update(user_params)
  #       # @user.skip_reconfirmation!
  #       sign_in(@user, :bypass => true)
  #       redirect_to root_url, notice: 'Your profile was successfully updated.'
  #     else
  #       @show_errors = true
  #     end
  #   end
  # end

  # DELETE /users/:id.:format
  # def destroy
  #   authorize! :delete, @user
    # @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to root_url }
    #   format.json { head :no_content }
    # end
  # end

  private

  # def set_user
  #   @user ||= User.find(params[:id])
  # end

  def user_params
    params.require(:user).permit(:full_name, :email, :password_confirmation, :remember_me)
  end
end
