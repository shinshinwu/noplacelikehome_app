require 'httparty'
require 'uri'
require 'pp'

helpers do
  def get_zillow_address_data(address, zipcode)
    address = URI.encode(address)
    # url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1az0o6cmnm3_8b748&address=#{address}&citystatezip=#{zipcode}&rentzestimate=true"
    # puts url
    # puts ")" * 800
    response = HTTParty.get("http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1az0o6cmnm3_8b748&address=#{address}&citystatezip=#{zipcode}&rentzestimate=true")
    # p response["searchresults"]["response"]
    if response["searchresults"]["response"]
      result = response["searchresults"]["response"]["results"]["result"][0]
      monthly_market_value = result["rentzestimate"]["amount"]["__content__"]
      total_market_value = result["zestimate"]["amount"]["__content__"]
      # pp result["bedrooms"]
      return { monthly_market_value: monthly_market_value.to_i, total_market_value: total_market_value.to_i, bedrooms: result["bedrooms"].to_i}
    else
      return false
    end
  end

  def to_boolean(string)
    string == 'true'
  end

end