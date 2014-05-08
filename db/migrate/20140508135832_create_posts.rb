class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.text :short
      t.string :state
      
      t.timestamps
    end
  end
end
