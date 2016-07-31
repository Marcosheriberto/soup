class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    super do
      resource.attributes = update_from_provided_attrs if session[:omniauth_info]
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:identity_ids])
  end

  def update_from_provided_attrs
    info_hash = session[:omniauth_info]
    {
      email: info_hash['email'],
      identity_ids: info_hash['identity_ids']
    }
  end
end
