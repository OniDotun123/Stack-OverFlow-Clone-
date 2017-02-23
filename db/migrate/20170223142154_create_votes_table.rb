class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :content, null: false
      t.integer :value, :default => 0
      t.integer :votable_id
      t.string :votable_type

      t.timestamps
    end
  end
end
