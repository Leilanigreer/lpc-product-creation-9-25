class CreateShopifyCollections < ActiveRecord::Migration[7.2]
  def change
    create_table :shopify_collections do |t|
      t.string :graphql_id
      t.integer :shopify_id
      t.string :title
      t.string :handle

      t.timestamps
    end
  end
end
