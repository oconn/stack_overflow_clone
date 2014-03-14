class QuestionsController < ApplicationController
  include VotesHelper

  before_filter :authenticate_user!, only: [:new]

  def index
    @questions = Question.all.sort_by! { |question| Visit.where(visitable_id: question.id).count }
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      flash[:notice] = "Question added!"
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @question_count = vote_total(@question)
    Visit.track(@question, request.remote_ip)
  end

  def mark_as_best
    @question = Question.find(params[:question_id])
    @question.update(best_answer: params[:answer_id])
    flash[:notice] = "Best Answer Selected"
    user = Answer.find(params[:answer_id]).user
    user.update(vote_points: (user.vote_points + 5))
    redirect_to @question
  end

  def destroy
    @question = Question.find(params[:id])
    @question.user.save
    @question.delete
    redirect_to root_path
  end

  def create_up_vote
    @question = Question.find(params[:id])
    if @question.votes.where(user_id: current_user.id).empty?
      @question.votes.create(user_id: current_user.id, vote_direction: true)
      @question.user.vote_points += 1
      @question.user.save
    end

    redirect_to @question
  end

  def create_down_vote
    @question = Question.find(params[:id])
    if @question.votes.where(user_id: current_user.id).empty?
      @question.votes.create(user_id: current_user.id, vote_direction: false)
      @question.user.vote_points -= 1
      @question.user.save
    end
    redirect_to @question
  end

  def search
    @search_content = params[:search_data]
    @questions = Question.where("title ILIKE (?)", "%#{@search_content}%")
  end



  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
