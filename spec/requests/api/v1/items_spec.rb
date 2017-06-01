require 'rails_helper'

RSpec.describe "requests items" do
  it "returns list of items" do
    Item.create(name: "foo", description: "barbaz", image_url: "www.image.jpg")
    Item.create(name: "bar", description: "barbaz", image_url: "www.image.jpg")
    Item.create(name: "baz", description: "barbaz", image_url: "www.image.jpg")

    get '/api/v1/items'

    expect(response).to be_success
    results = JSON.parse(response.body)
    item_1 = results.first

    expect(results.count).to eq(3)
    expect(item_1["name"]).to eq("foo")
  end

end