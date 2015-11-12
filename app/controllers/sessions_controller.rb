class SessionsController < ApplicationController

  expose(:admin) { Admin.where(email: params[:email].downcase).first }

  def create
    if admin && admin.authenticate(params[:password])
      sign_in(admin, remember: params[:remember])
      redirect_to :root
    else
      redirect_to :sign_in
    end
  end

  def destroy
    sign_out_admin
    redirect_to :sign_in
  end
end
