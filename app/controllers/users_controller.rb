# frozen_string_literal: true

# users
class UsersController < ApplicationController
  before_action :authorize, except: %i[new create]
  before_action :no_authorize, only: %i[new create]

  # GET /users/new
  def new; end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать, #{@user.name}!"
      redirect_to root_path
    else
      redirect_to new_user_path, notice: 'Ошибка во вводе данных или вы уже зарегистрированы'
    end
  end

  def show
    @users = User.select(:id, :name, :email, :created_at, :updated_at)
    render xml: @users
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
