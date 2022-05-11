class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
     @users = User.all
    render json: @users, only: %i[name age gender]
  end

  def show
    render json: @user, only: %i[name age gender]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :gender)
  end

  def set_user
    @user = User.find(params[:id])
  end



end
