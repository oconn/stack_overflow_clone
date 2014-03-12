class QuestionsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index

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
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to root_path
  end
  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
