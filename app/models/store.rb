class Store
  attr_reader :name,
              :distance,
              :phone,
              :store_type

  def initialize(attributes = {})
    @name = attributes[:name]
    @distance = attributes[:distance]
    @phone = attributes[:phone]
    @store_type = attributes[:storeType]
  end

  def self.find_by_zip(zip)
    
    service = BestbuyService.new
    stores = service.find_stores_by_zip(zip)
    stores.map do |store|
      Store.new(store)
    end
  end
end
