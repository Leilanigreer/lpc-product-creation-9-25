class CreateLeatherColors < ActiveRecord::Migration[7.2]
  def change
    create_table :leather_colors do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
