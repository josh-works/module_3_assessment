require 'rails_helper'

RSpec.describe Store, type: :model do
  context "when returning results from API" do
    it "can be built from a hash" do
      store = Store.new({
                        "name": "CHERRY CREEK MALL",
                        "distance": 3.45,
                        "phone": "303-270-9189",
                        "storeType": "Mobile SAS"
      })

      expect(store.name).to eq("CHERRY CREEK MALL")
      expect(store.distance).to eq(3.45)
    end
  end

  context ".find_by_zip" do
    it "returns list of stores" do
      zip = 80202
      stores = Store.find_by_zip(zip)
      store = stores.first

      expect(stores.count).to eq(16)
      expect(store).to respond_to(:name)
      expect(store).to respond_to(:distance)

    end
  end
end
