class CreateArticle < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title #le estamos seteando los atributos a la tabla, despues la debo crear con rails db:migrate
      t.text :description 
    end
  end
end
