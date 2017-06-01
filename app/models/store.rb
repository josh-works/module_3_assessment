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
    response = Faraday.get('https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=name,distance,phone,storeType&pageSize=100&apiKey=uf3hrj9pa5u2jxvqa3xfq5a5')
    results = JSON.parse(response.body, symbolize_names: true)[:stores]
    results.map do |store|
      Store.new(store)
    end
  end

end
