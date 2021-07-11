class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :historier_id
      t.integer :receiver_id
      t.integer :publication_id
      t.text :tipo
      t.timestamps
    end
  end
end
