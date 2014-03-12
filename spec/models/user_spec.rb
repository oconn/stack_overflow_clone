require 'spec_helper'

describe User do
  
  context "when signing up" do

    context "with valid credentials" do
      # let(:user) {User.new(username: "oconn", password: "testtest", password_confirmation: "testtest")}
      
      it "will redirect the user to their homepage and display a welcome message" do
        visit '/users/sign_up'
        fill_in 'Username', with: 'oconn'
        fill_in 'Email', with: "matt@matt.com"
        fill_in 'Password', with: 'testtest'
      end
    end

    context "with invalid credentials" do
      pending
    end
  end
end
