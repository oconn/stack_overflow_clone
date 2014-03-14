require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe Question do

  context "when asking question" do

    # CODE REVIEW: This is the wrong place for feature tests. Tests here should
    # be unit tests
    context "with valid inputs" do
      let(:user) {User.create!(username: "oconn", email: "dan@dan.com", password: "testtest", password_confirmation: "testtest")}

      it "redirect user to the question page upon successful completion of form" do

        login_as(user, :scope => :user)
        visit '/questions/new'
        fill_in 'Title', with: 'What is love?'
        fill_in 'Body', with: 'baby don\'t hurt me'

        click_button("Create Question")
        expect(page).to have_content "What is love?"
      end
    end
  end
end
