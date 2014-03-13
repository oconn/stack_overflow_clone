class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :visitable, polymorphic: true
      t.integer :total_visits
      t.integer :unique_visits
      t.timestamps
    end
  end
end
