class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.belongs_to :user, index: true
      t.string :titulo
      t.string :image
      t.string :especie
      t.string :tipo
      t.string :precio
      t.text :direccion
      t.boolean :vigente, :default => true
      t.timestamps
    end
  end
end
