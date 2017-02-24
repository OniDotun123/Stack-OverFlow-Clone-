class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :commentable, polymorphic: true, index: true
      t.references :user
      
      t.timestamps
    end
  end
end
