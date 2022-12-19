# frozen_string_literal: true

# application
class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  private

  def current_user
    @current_user ||= session[:user_id] &&
                      User.find_by_id(session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  def no_authorize
    return unless signed_in?

    flash[:warning] = 'Вы уже авторизованы'
    redirect_to root_path
  end

  def authorize
    return if signed_in?

    flash[:warning] = 'Вы не авторизованы'
    redirect_to new_session_path
  end
end
