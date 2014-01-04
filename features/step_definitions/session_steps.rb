Given "I am signed in" do
  @me = Fabricate(:admin)
    step "I am on the sign in page"
    step %Q(I fill in "email" with "#{@me.email}")
    step %Q(I fill in "password" with "password")
    step %Q(I press "sign in")
end
