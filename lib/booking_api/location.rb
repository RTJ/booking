module BookingApi
  class Location

    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    ########################################################
    # Returns a translated list of cities with their IDs 

    # Example: 
    # city_params = {
    #   countrycodes: "ar"
    # }

    # response = BookingApi::Localtion.new.get_cities(request_parameters: city_params)

    # puts response.body
    # {
    #   "nr_hotels": "1",
    #   "city_id": "-3875419",
    #   "longitude": "-63.91669845581055",
    #   "countrycode": "ar",
    #   "latitude": "11.116700172424316",
    #   "name": "Pedro Gonzalez",
    #   "languagecode": "en"
    # }

    def get_cities(request_parameters: {})
      default_parameters = {}
      http_service.request_post("/json/bookings.getCities", default_parameters.merge(request_parameters))
    end

    ########################################################
    # Returns countrycodes and their translated names. If a country name is not available in the requested language it's English name will be returned instead.

    # Example: 
    # country_params = {
    #   countrycodes: "ar",
    #   languagecodes: "en",
    #   rows: 100
    # }

    # response = BookingApi::Localtion.new.get_countries(request_parameters: country_params)

    # puts response.body
    # {
    #   "area": "Middle East",
    #   "countrycode": "ae",
    #   "languagecode": "en",
    #   "name": "United Arab Emirates"
    # }

    def get_countries(request_parameters: {})
      default_parameters = {}
      http_service.request_post("/json/bookings.getCountries", default_parameters.merge(request_parameters))
    end

    ########################################################
    # Returns a list of district_id and hotel_id pairs. This function expects any of the following search parameters: countrycodes, city_ids, district_ids and last_change.

    # Example: 
    # country_params = {
    #   city_ids: 701
    #   countrycodes: "us",
    #   languagecodes: "en",
    #   rows: 100
    # }

    # response = BookingApi::Localtion.new.get_districts(request_parameters: country_params)

    # puts response.body
    # {
    #   "countrycode": "jm",
    #   "languagecode": "en",
    #   "district_id": "6274",
    #   "name": "New Kingston",
    #   "city_id": "-3752438 ",
    #   "nr_hotels": "37"
    # }

    def get_districts(request_parameters: {})
      default_parameters = {}
      http_service.request_post("/json/bookings.getDistricts", default_parameters.merge(request_parameters))
    end

    private

  end
end
