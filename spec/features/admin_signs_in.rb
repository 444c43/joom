require 'spec_helper'

feature 'Admin signs in' do
  scenario 'with valid email and password' do
    admin = Admin.new(email: 'admin@joom.com', password: 'password')
    admin.save!

    login_with 'admin@joom.com', 'password'

    expect(page).to have_content('Admin Functions')
  end

  def login_with(email, password)
    visit sign_in_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign In'
  end
end
