require "spec_helper"

describe "Welcome Page" do
  xit "has a descriptive title" do

  end

  it "lists question links that can be clicked" do
  	question = Question.create!(title: "Test Title", body: "Some test body text")
  	visit "/"
  	click_link("Test Title")
  end
end
