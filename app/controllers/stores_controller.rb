class StoresController < ApplicationController

  def index
    response = Faraday.get('https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=name,distance,phone,storeType&apiKey=uf3hrj9pa5u2jxvqa3xfq5a5')
    results = JSON.parse(response.body, symbolize_names: true)[:stores]
    @stores = results.map do |store|
      Store.new(store)
    end

  end



end
