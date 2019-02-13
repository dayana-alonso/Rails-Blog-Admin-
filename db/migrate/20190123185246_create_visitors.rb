class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :fullname
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
