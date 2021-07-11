class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :publication, index: true
      t.text :contenido
      t.timestamps
    end
  end
end
