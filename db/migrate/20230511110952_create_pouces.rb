class CreatePouces < ActiveRecord::Migration[7.0]
  def change
    create_table :pouces do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :gossip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
