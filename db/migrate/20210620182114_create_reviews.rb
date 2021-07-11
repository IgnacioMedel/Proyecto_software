class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :requestor_id
      t.integer :receiver_id
      t.integer :calificacion
      t.string :contenido

      t.timestamps
    end
  end
end
