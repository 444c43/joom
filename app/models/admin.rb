class Admin < ActiveRecord::Base
  include Authem::User

  attr_accessible :body, :published

  #attr_accessible :email, :password_digest, :remember_token, :session_token
end
