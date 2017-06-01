class Store
  attr_reader :name,
              :distance,
              :phone,
              :storeType

  def initialize(attributes = {})
    @name = attributes[:name]
    @distance = attributes[:distance]
    @phone = attributes[:phone]
    @storeType = attributes[:storeType]
  end

end
