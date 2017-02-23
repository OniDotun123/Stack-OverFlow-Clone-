class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :content, null: false
      t.integer :value, :default => 0
      t.references :votable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
