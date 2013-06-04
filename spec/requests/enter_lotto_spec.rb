require 'spec_helper'

describe "I am entering the lotto", js: true do
  it "should win each of your users a ticket" do
    Users.each do |user|
      visit "http://vtix.shakespeareinthepark.org/"
      fill_in "Username:", with: user.username
      fill_in "Password:", with: user.password
      click_on "Sign In"

      if page.has_content?("Enter participant name and address")
        fill_in "ContentPlaceHolder1_VirtualLottery1_NameField", with: user.full_name
        fill_in "ContentPlaceHolder1_VirtualLottery1_AddressField", with: user.address
        select "General", from: "ContentPlaceHolder1_VirtualLottery1_LineTypeField"
        click_on "CONTINUE"
        check "ContentPlaceHolder1_VirtualLottery1_AgreeField"
        click_on "CLICK HERE TO SUBMIT"
        page.should have_content "You have successfully registered for today’s Virtual Ticketing drawing!"
        puts "#{user.full_name} has successfully entered"
      elsif page.has_content? "Your entry has been accepted."
        puts "#{user.full_name} has already entered"
      elsif page.has_content? "Unable to sign in with that username and password"
        puts "#{user.full_name} has the wrong username or password"
      else
        puts "something went wrong with #{user.full_name}"
      end
      click_on "Logout"
    end
  end
end
