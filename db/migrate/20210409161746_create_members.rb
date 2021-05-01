class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :nickname
      t.string :team
      t.date :birthday
      t.integer :gen
      t.integer :score
      t.timestamps
    end
  end
end
