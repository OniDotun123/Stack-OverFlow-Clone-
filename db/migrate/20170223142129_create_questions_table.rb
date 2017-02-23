class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, null: false
      t.string :title,  null: false
      t.string :content, null: false
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
