require 'rails_helper'

RSpec.describe "requests items via API" do
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
    expect(item_1["description"]).to eq("barbaz")
    expect(item_1["image_url"]).to eq("www.image.jpg")
  end

  it "can show a single item" do
    item = Item.create(name: "foo", description: "barbaz", image_url: "www.image.jpg")

    get "/api/v1/items/#{item.id}"
    expect(response).to have_http_status(200)

    result = JSON.parse(response.body)

    expect(result["name"]).to eq("foo")
  end

  it "can create a new item" do
    item_params = {name: "foo", description: "barbaz", image_url: "www.image.jpg"}
    expect(Item.count).to eq(0)

    post '/api/v1/items', {item: item_params}
    item = Item.last

    expect(response).to have_http_status(201)
    expect(Item.count).to eq(1)
    expect(item.name).to eq("foo")
  end

  it "can delete an item" do
    item = Item.create(name: "foo", description: "barbaz", image_url: "www.image.jpg")

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to have_http_status(204)
    expect(Item.count).to eq(0)
  end

  it "cannot delete an item that doesn't exist" do
    delete "api/v1/items/33"
    expect(response).to have_http_status(418)
  end


end
