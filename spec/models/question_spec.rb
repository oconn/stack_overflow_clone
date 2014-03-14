require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe Question do
   context 'Question validations' do
    it 'Should not save a question with an empty title' do
        question = Question.create(body: 'some stuff in the body of the question')
        expect(question.valid?).to eq(false)
    end

    it 'Should not save a question with an empty body' do
      question = Question.create(title: 'Some title here!')
      expect(question.valid?).to eq(false)
    end

    it 'Should not save a question without a user id' do
      question = Question.create(title: 'something here', body: 'some more stuff here')
      expect(question.valid?).to eq(false)
    end

    it 'Should save a question that has a title, body, and user id' do
      question = Question.create(title: 'Fun times here', body: 'body teeeexxxttt!!!!!!', user_id: 1)
      expect(question.valid?).to eq(true)
    end

    it 'Title should have at least a length of 5 characters' do
      question = Question.create(title: 'Hey', body: 'Some stuff about dragons here', user_id: 1)
      expect(question.valid?).to eq(false)
    end

    it 'Body should have at least a length of 5 characters' do
      question = Question.create(title: 'Some title about dragons', body: 'Hey', user_id: 1)
      expect(question.valid?).to eq(false)
    end
  end

  context "when asking question" do
    context "with valid inputs" do
      let(:user) {User.create(username: "oconn", email: "dan@dan.com", password: "testtest", password_confirmation: "testtest")}

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
