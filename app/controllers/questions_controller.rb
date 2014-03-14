class QuestionsController < ApplicationController
  include VotesHelper

  before_filter :authenticate_user!, only: [:new]

  def index
    # CODE REVIEW: This is REALLY confusing. My initial reaction was that this
    # should be (at a minumum):
    # Question.all.sort_by! { |question| question.visits.count }
    # But it turns out that Visit is a has_one association from Question. What
    # is actually happening here? If this is actually a has_many (like it looks)
    # then this sorting should be able to be done in the DB
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
    # CODE REVIEW: why not just call vote_total(@question) in the view?
    @question_count = vote_total(@question)
    Visit.track(@question, request.remote_ip)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.user.vote_points -= 1
    @question.user.save
    @question.delete
    redirect_to root_path
  end

  def create_up_vote
    @question = Question.find(params[:id])
    if @question.votes.where(user_id: current_user.id).empty?
      @question.votes.create(user_id: current_user.id, vote_direction: true)
      # CODE REVIEW: There's an AR method that can increment counter cache
      # columns
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
