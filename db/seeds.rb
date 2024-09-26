require 'json'
require 'csv'

def extract_id_split(gid)
  gid.split('/').last
end

session = ShopifyAPI::Auth::Session.new(
  shop: 'littleprincecustoms.myshopify.com',
  access_token: ENV["SHOPIFY_API_KEY"],
)
# session is built as part of the OAuth process
client = ShopifyAPI::Clients::Graphql::Admin.new(
  session: session
)

# collection_query = <<~QUERY
#   query {
#     collections(first: 20) {
#       edges {
#         node {
#           id
#           title
#           handle
#           updatedAt
#           sortOrder
#         }
#       }
#     }
#   }
# QUERY

# collections = client.query(
#   query: collection_query,
# )
# # p collections

# collections_data = collections.body['data']['collections']['edges']

# collections_data.each do |collection|
#   graphql_id = collection['node']['id']
#   shopify_id = extract_id_split(graphql_id)
#   title = collection['node']['title']
#   handle = collection['node']['handle']
#   puts "ID: #{graphql_id}, Shopify ID: #{shopify_id} Title: #{title}"
#   add_collection = ShopifyCollection.create(
#     graphql_id: graphql_id,
#     shopify_id: shopify_id,
#     title: title,
#     handle: handle,
#   )
# end

file = File.join(Rails.root, "db", "LeatherColorNoHeader.csv")
CSV.foreach(file) do |row|
  color = row[0]
  p color
  abbreviation = row[1]
  p abbreviation
  # LeatherColor.create(name: color, abbreviation: abbreviation)
end

file = File.join(Rails.root, "db", "Style.csv")
CSV.foreach(file) do |row|
p row
end
