class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

#table called post
  # has one comment

#table called comments
  # has text
  # has a user
  # has parent comment OR NOT
