class CreateDownvotesTable < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer :value, :default => 0
      t.references :downvotable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
