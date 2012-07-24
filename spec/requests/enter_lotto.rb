require 'spec_helper'

describe "I am entering the lotto", js: true do
  it "should win each of your users a ticket" do
    Users.each do |user|
      visit "http://shakespeareinthepark.org/tickets/virtual-ticketing"
      click_on "Click here to enter today's ticket drawing."
      fill_in "LoginForm_Username", with: user.username
      fill_in "LoginForm_Password", with: user.password
      click_on "Sign in"
      fill_in "VtixFormStep1_FullName", with: user.full_name
      fill_in "VtixFormStep1_StreetAddress", with: user.address
      select "General", from: "VtixFormStep1_SeatingPref"
      click_on "Continue"
      check "VtixFormStep2_Agree"
      click_on "Submit entry"
      page.should have_content "You have successfully entered today's Virtual Ticket Drawing for General seating!"
      click_on "Sign out"
    end
  end
end
