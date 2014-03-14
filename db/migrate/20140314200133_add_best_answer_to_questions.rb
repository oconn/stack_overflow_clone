class AddBestAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :best_answer, :integer
  end
end
