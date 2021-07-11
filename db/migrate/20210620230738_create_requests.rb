class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :requestor_id
      t.integer :receiver_id
      t.string :status
      t.text :contenido
      t.integer :publication_id
      t.timestamps
    end
  end
end
