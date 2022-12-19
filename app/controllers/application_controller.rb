# frozen_string_literal: true

class ApplicationController < ActionController::Base
    private
    # Возвращает объект User с ID, сохраненный в session с ключом
    # :current_user_id Это стандартный способ для Rails
    # Процедура входа устанавливает значение сессии
    # Процедура выхода сбрасывает значение сессии
    def current_user # авторизованный пользователь
        @_current_user ||= session[:current_user_id] &&
        User.find_by_id(session[:current_user_id])
    end

    def signed_in?
        current_user.present?
    end

    def no_authorize
        return unless signed_in?
        flash[:warning] = 'You are already logged in'
        redirect_to root_path
    end

    def authorize
        return if signed_in?
        flash[:warning] = 'You are not logged in'
        redirect_to new_session_path
    end
    helper_method :current_user, :signed_in?
end
