require "spec_helper"

describe "Welcome Page" do
  # CODE REVIEW: This is the wrong place for feature tests. Tests here should
  # be unit tests
  it "lists question links that can be clicked" do
  	question = Question.create!(title: "Test Title", body: "Some test body text")
  	visit "/"
  	click_link("Test Title")
  end
end