class SessionsController < ApplicationController
  before_action :no_authorize, only: %i[new create]
  before_action :authorize, only: :destroy 

  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      # Сохраняем идентификатор пользователя ID в сессию
      # для последующего использования
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

  def destroy
    # Удалить id пользователя из session
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end

end
