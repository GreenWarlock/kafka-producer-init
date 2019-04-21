class UsersController < ApplicationController
  before_action :set_user, only: %w[edit update destroy]

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  def statistics

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :birthday,
                                 :city, :country)
  end
end
