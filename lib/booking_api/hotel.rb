module BookingApi
  class Hotel

    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    # checks for the given parameters if the hotel is available
    def get_availabillity(request_parameters: {})
      default_parameters = {
        room1: "A,A",
      }
      http_service.request_post("/json/getHotelAvailabilityV2", default_parameters.merge(request_parameters))
    end
 
    def get_block_availability(request_parameters)
      http_service.request_post("/json/bookings.getBlockAvailability", request_parameters)
    end

    # gets hotel photos for the given hotel ids
    def get_photos(hotel_ids: [], request_parameters: {})
      raise ArgumentError if hotel_ids.empty?
      default_parameters = {
        hotel_ids: hotel_ids.join(",")
      }
      response = http_service.request_post("/json/bookings.getHotelDescriptionPhotos", default_parameters.merge(request_parameters))
      Images::ResponseList.new(response)

      # https://distribution-xml.booking.com/json/bookings.getHotelDescriptionPhotos?city_ids=-3875419,-3875418

    end

        # gets hotel photos for the given hotel ids
    def get_hotels_photos(hotel_ids: [], request_parameters: {})
      raise ArgumentError if hotel_ids.empty?
      default_parameters = {
        hotel_ids: hotel_ids.join(",")
      }
      http_service.request_post("/json/bookings.getHotelPhotos", default_parameters.merge(request_parameters))

      # https://distribution-xml.booking.com/json/bookings.getHotelPhotos?hotel_ids=502335
    end


    # gets detailed descriptions for the given hotels
    def get_description(request_parameters)
      http_service.request_get("/json/bookings.getHotelDescriptionTranslations", request_parameters)
    end

    # gets detailed descriptions for the given hotels
    def get_rooms(request_parameters)
      http_service.request_get("/json/bookings.getRooms", request_parameters)
      # https://distribution-xml.booking.com/json/bookings.getRooms?rows=10&hotel_ids=121543
    end


    # gets an overview of the data for the given hotel ids.
    def get_hotel_information(hotel_ids: [], request_parameters: {})
      default_parameters = {}
      default_parameters[:hotel_ids] = hotel_ids.join(",") if hotel_ids.any?
      http_service.request_post("/json/bookings.getHotels", default_parameters.merge(request_parameters))
    end

    # Returns hotel facility types..
    def get_hotel_facility_types(request_parameters)
      http_service.request_get("/json/bookings.getHotelFacilityTypes", request_parameters)
    end

        # Returns hotel facilities..
    def get_hotel_facilities(request_parameters)
      http_service.request_get("/json/bookings.getHotelFacilities", request_parameters)
    end

    private

  end
end
