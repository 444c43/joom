class ApplicationController < ActionController::Base

  authem_for :admin

  protect_from_forgery

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def deny_admin_access
    redirect_to :sign_in unless admin_signed_in?
  end
end
