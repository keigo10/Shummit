# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Event.ransack(params[:q])
    @search_events = @search.result
  end

  def after_sign_in_path_for(_resource)
    if admin_signed_in?
      admins_users_path
    elsif user_signed_in?
      events_main_path
    else
      root_path
    end
   end

  def after_sign_up_path_for(_resource)
    if admin_signed_up?
      admins_users_path
    elsif user_signed_in?
      events_main_path
    else
      root_path
      end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email first_name family_name first_name_kana family_name_kana email tel])
    # devise_parameter_sanitizer.permit(:sign_in,  keys: [:password])
  end
end
