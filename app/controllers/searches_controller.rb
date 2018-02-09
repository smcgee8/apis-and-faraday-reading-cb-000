class SearchesController < ApplicationController
  def search
  end

  def foursquare
      @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = "VWP4H01SVNQMRAKFLKZIQT5ZQ5EXSNVLITEFAOHQGWGS34BT"
        req.params['client_secret'] = "AS0JMSYYXD0PGDTPF3QM2I2EZJJNLNB5YIXMBCY4VYV00NVA"
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
      end
      body_hash = JSON.parse(@resp.body)
      @venues = body_hash["response"]["venues"]
      render 'search'
    end

end
