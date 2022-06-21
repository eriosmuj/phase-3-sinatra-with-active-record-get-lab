class ApplicationController < Sinatra::Base

    set :default_content_type, 'application/json'

    get '/bakeries' do
        # get all the bakeries from the database
        bakeries = Bakery.all
        # send them back as a JSON array
        bakeries.to_json
    end

    get '/bakeries/:id' do
      # look up the bakery in the database using its ID
      bakery = Bakery.find(params[:id])
      # send a JSON-formatted response of the bakery data
      bakery.to_json(include: :baked_goods)
    end


    get '/baked_goods/by_price' do
      baked_goods = BakedGood.order(price: :desc)
      baked_goods.to_json
    end

    get '/baked_goods/most_expensive' do
      expensive_good = BakedGood.order(price: :desc).limit(1)
      expensive_good[0].to_json
    end
  end

