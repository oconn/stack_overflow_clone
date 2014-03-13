class QuestionsController < ApplicationController
  include VotesHelper

  before_filter :authenticate_user!, only: [:new]

  def index
    @questions = Question.all.order(votes
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.questions.build(question_params)

    if question.save
      flash[:notice] = "Question added!"
      redirect_to question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @question_count = vote_total(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to root_path
  end

  def create_up_vote
    @question = Question.find(params[:id])
    if @question.votes.where(user_id: current_user.id).empty?
      @question.votes.create(user_id: current_user.id, vote_direction: true)
    end
    redirect_to @question
  end

  def create_down_vote
    @question = Question.find(params[:id])
    if @question.votes.where(user_id: current_user.id).empty?
      @question.votes.create(user_id: current_user.id, vote_direction: false)
    end
    redirect_to @question
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
