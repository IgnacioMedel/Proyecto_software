class CreateWannaBeAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :wanna_be_administrators do |t|
      t.integer :requestor_id
      t.string :status , :default => "pending"

      t.timestamps
    end
  end
end
