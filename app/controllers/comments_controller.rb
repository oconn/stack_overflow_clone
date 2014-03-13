class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @question = nil
    @answer = nil
    if params[:question_id]
      @question = Question.find(params[:question_id])
    elsif params[:answer_id]
      @answer = Answer.find(params[:answer_id])
    end
  end

  def create
    if (params[:question])
      question = Question.find(params[:question])
      comment = question.comments.new(body: params[:comment][:body], commentable_id: params[:question], commentable_type: "question")
      comment.user_id = current_user.id
      comment.save
      redirect_to question_path(question.id)
    else
      answer = Answer.find(params[:answer])
      comment = answer.comments.new(body: params[:comment][:body], commentable_id: params[:answer], commentable_type: "answer")
      comment.user_id = current_user.id
      comment.save
      redirect_to question_path(answer.question.id)
    end
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :answer_id, :question_id, :commentable_type)
  end
end
