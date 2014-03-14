class AnswersController < ApplicationController
  include VotesHelper
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to @question
    else
      # CODE REVIEW: What the heck?
      p "failed"
    end
  end

  def create_up_vote
    @answer = Answer.find(params[:id])
    if @answer.votes.where(user_id: current_user.id).empty?
      @answer.votes.create(user_id: current_user.id, vote_direction: true)
      @answer.user.vote_points += 1
      @answer.user.save
    end
    redirect_to @answer.question
  end

  def create_down_vote
    @answer = Answer.find(params[:id])
    if @answer.votes.where(user_id: current_user.id).empty?
      @answer.votes.create(user_id: current_user.id, vote_direction: false)
      @answer.user.vote_points -= 1
      @answer.user.save
    end
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
