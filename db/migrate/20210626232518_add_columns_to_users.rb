class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :administrador, :boolean, :default => false 
    add_column :users, :image, :string
    add_column :users, :genero, :string
    add_column :users, :clasificacion, :integer, :default => 0
    add_column :users, :comuna, :string
    add_column :users, :ciudad, :string
  end
end
