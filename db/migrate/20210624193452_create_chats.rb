class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :requestor_id
      t.integer :receiver_id
      t.string :status, :default => "pending"
      t.timestamps
    end
  end
end
