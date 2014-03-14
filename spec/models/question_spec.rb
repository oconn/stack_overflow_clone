require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe Question do

  it 'Should not save a question with an empty title' do
    expect {
      Question.create(body: 'some stuff in the body of the question')
    }.to change(Question, :count).by(0)
  end

  context "when asking question" do

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
