class AddColumnVotecountForUsers < ActiveRecord::Migration
  def change
    add_column :users, :vote_points, :integer, default: 0
  end
end
