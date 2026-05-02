class CreateContents < ActiveRecord::Migration[7.2]
  def change
    create_table :contents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, default: ""
      t.string :url
      t.string :media_type, null: false, default: ""
      t.integer :status, null: false, default: 0
      t.integer :rating
      t.text :memo

      t.timestamps
    end
  end
end
