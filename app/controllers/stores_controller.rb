class StoresController < ApplicationController

  def index
    @all_stores = Store.find_by_zip

    # response = Faraday.get('https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=name,distance,phone,storeType&pageSize=100&apiKey=uf3hrj9pa5u2jxvqa3xfq5a5')
    # results = JSON.parse(response.body, symbolize_names: true)[:stores]
    # @all_stores = results.map do |store|
    #   Store.new(store)
    # end
    @stores = @all_stores[0..9]

  end



end
