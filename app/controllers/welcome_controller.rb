class WelcomeController < ApplicationController
  def index
    @questions = Question.all
  end
end