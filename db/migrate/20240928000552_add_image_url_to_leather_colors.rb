class AddImageUrlToLeatherColors < ActiveRecord::Migration[7.2]
  def change
    add_column :leather_colors, :image_url, :string
  end
end
