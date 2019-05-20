class UsersController < ApplicationController
  before_action :set_user, only: %w[show update destroy]
  after_action :create_message, only: %w[show]

  def index
    @users = User.all
  end

  def show; end

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
    response = HTTParty.get("http://localhost:3001/views/#{params[:user_id]}")

    @hash = JSON.parse(response.body)

    @hash[:user] = User.find(params[:user_id])

    render 'users/statistics'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def create_message
    return if params[:id].to_i == current_user.id

    DeliveryBoy.deliver_async({ resource_visited: params[:id].to_i,
                                user: current_user.email,
                                city: current_user.city }.to_json,
                              topic: 'profile', partition_key: params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :birthday,
                                 :city, :country)
  end
end
