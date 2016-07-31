class SessionsController < ApplicationController

  def create
    @identity = FindIdentityService.perform(request.env['omniauth.auth'])

    if user_signed_in?
      @identity.user == current_user ? already_linked_account : link_account
    else
      @identity.user.present?? login_user : finish_registration
    end
  end

  def failure
    flash[:error] = params[:message]
    redirect_to root_path
  end

  private

  def already_linked_account
    redirect_to origin_url, notice: t('.already_linked')
  end

  def link_account
    @identity.user = current_user
    @identity.save
    redirect_to origin_url, notice: t('.link_account')
  end

  def login_user
    sign_in @identity.user
    redirect_to origin_url, notice: t('.signed_in')
  end

  def finish_registration
    info_hash = request.env['omniauth.auth']['info']
    info_hash[:identity_ids] = [@identity.id] if info_hash
    session[:omniauth_info] = info_hash
    redirect_to new_user_registration_url, notice: t('.finish_registering')
  end

  def origin_url
    request.env['omniauth.origin'] || root_url
  end
end
