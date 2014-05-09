class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, index: true
      t.boolean :flag, default: false
      
      t.timestamps
    end
  end
end
