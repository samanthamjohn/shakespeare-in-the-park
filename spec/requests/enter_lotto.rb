require 'spec_helper'

describe "I am entering the lotto", js: true do
  it "should win me a ticket" do
    visit "http://shakespeareinthepark.org/tickets/virtual-ticketing"
    click_on "Click here to enter today's ticket drawing."
    fill_in "LoginForm_Username", with: "smj2118"
    fill_in "LoginForm_Password", with: "samiscool"
    click_on "Sign in"
  end
end
