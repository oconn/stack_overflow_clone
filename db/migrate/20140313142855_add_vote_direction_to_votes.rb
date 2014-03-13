class AddVoteDirectionToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :vote_direction, :boolean
  end
end
