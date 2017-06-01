class BestbuyService

  def initialize
    @conn = Faraday.new('https://api.bestbuy.com')
    @key = ENV["BESTBUY_API_KEY"]
  end

  def find_stores_by_zip(zip)
    response = conn.get("/v1/stores(area(#{zip},25))?format=json&show=name,distance,phone,storeType&pageSize=100&apiKey=#{key}")
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end

  private

  attr_reader :conn,
              :key

end
