class ChangeShopifyIdToString < ActiveRecord::Migration[7.2]
  def change
    change_column :shopify_collections, :shopify_id, :string
  end
end
