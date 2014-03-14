# CODE REVIEW: "welcome" doesn't seem like a great name for this controller.
# The index action reflects this responsibility, but not the other actions
class WelcomeController < ApplicationController
  def index
    @questions = Question.all
  end

  def top_users
    @users = User.all.order('vote_points DESC').limit(10)
  end

  def user
    @user = User.find(params[:format])
  end
end
