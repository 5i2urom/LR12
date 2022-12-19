# frozen_string_literal: true

# sessions
class SessionsController < ApplicationController
  before_action :no_authorize, only: %i[new create]
  before_action :authorize, only: :destroy

  def new; end

  # rubocop:disable Metrics/AbcSize
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Добро пожаловать, #{user.name}!"
      redirect_to root_url
    else
      flash[:error] = 'Неверный логин и/или пароль'
      redirect_to new_session_path
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    @_current_user = session[:user_id] = nil
    redirect_to new_session_path
  end
end
