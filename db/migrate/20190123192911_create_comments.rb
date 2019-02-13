class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :status
      t.integer :post_id
      t.integer :visitor_id

      t.timestamps
    end
  end
end
