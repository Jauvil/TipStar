class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :dollar
      t.integer :cent
      t.references :customer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
