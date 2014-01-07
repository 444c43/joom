Then "I should see at least one photo" do
  page.should have_xpath("//article[@class='photo']//img")
end
