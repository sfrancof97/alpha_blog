class AddTimestampsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :created_at, :datetime #esto es para crear la nueva columna(nombre de la tabla, nombre de la columna y el tipo de carcter string o integer)
    add_column :articles, :update_at, :datetime
  end
end
