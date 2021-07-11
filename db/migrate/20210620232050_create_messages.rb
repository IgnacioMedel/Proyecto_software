class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.integer :speaker_id
      t.text :contenido
      t.timestamps
    end
  end
end
