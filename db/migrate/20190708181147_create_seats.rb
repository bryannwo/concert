class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :numeracion
      t.string :localidad
      t.integer :precio

      t.timestamps
    end
  end
end
