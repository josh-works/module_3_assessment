require 'rails_helper'

RSpec.describe BestbuyService, type: :model do
  context "when calling API" do
    it "returns hash of stores" do
      zip = 80202
      service = BestbuyService.new
      response = service.find_stores_by_zip(zip)
      response_object = response.first

      expect(response.count).to eq(16)

      expect(response_object[:name]).to eq("CHERRY CREEK MALL")
      expect(response_object[:distance]).to eq(3.45)
      expect(response_object[:storeType]).to eq("Mobile SAS")
    end
  end

end
