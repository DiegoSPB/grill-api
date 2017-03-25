class CreateNamings < ActiveRecord::Migration[5.0]
  def change
    create_table :namings do |t|
      t.string :name
      t.text :code

      t.timestamps
    end
  end
end
