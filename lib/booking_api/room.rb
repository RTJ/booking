module BookingApi
  class Room

    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    # gets hotel photos for the given hotel ids
    def get_room_photos(room_ids: [], request_parameters: {})
      raise ArgumentError if room_ids.empty?
      default_parameters = {
        room_ids: room_ids.join(",")
      }
      http_service.request_get("/json/bookings.getRoomPhotos", default_parameters.merge(request_parameters))
    end

    def get_room_translations(room_ids: [], request_parameters: {})
      raise ArgumentError if room_ids.empty?
      default_parameters = {
        room_ids: room_ids.join(",")
      }
      http_service.request_get("/json/bookings.getRoomTranslations", default_parameters.merge(request_parameters))
    end

    def get_room_facility_types(request_parameters)
      http_service.request_get("/json/bookings.getRoomFacilityTypes", request_parameters)
    end

    def get_room_facilities(request_parameters)
      http_service.request_get("/json/bookings.getRoomFacilities", request_parameters)
    end

    private

  end
end

