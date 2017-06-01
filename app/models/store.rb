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

end
