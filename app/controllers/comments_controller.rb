class CommentsController < ApplicationController
  def create
    p params
    p "-------------------------------------"
    if (params[:question_id])
      question = Question.find(params[:question_id])
      comment = question.comments.new(body: "test", commentable_id: params[:question_id], commentable_type: "question")
      comment.user_id = current_user.id
      comment.save
    else
      answer = Answer.find(params[:answer_id])
      comment = answer.comments.new(body: "test", commentable_id: params[:answer_id], commentable_type: "answer")
      comment.user_id = current_user.id
      comment.save
    end

    redirect_to root_path
  end
end
