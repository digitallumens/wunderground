module Wunderground
  class Astronomy < Hash
    def sunrise
      { hour: self["sunrise"]["hour"].to_i, minute: self["sunrise"]["minute"].to_i }
    end

    def sunset
      { hour: self["sunset"]["hour"].to_i, minute: self["sunset"]["minute"].to_i }
    end

    def method_missing(method, *args, &block)
      if self[method.to_s]
        self[method.to_s]
      else
        super
      end
    end

    class << self
      def get(*args)
        path = "#{Wunderground.base_path}/astronomy/q/"

        args = args.reduce({}, :merge)

        if args.keys.include?(:latitude) and args.keys.include?(:longitude)
          path += "#{args[:latitude]},#{args[:longitude]}.json"

        elsif location = Wunderground::Geolookup.get(args)
          path += "#{location.latitude},#{location.longitude}.json"

        else
          raise "Astronomy.get() does not understand #{args}"
        
        end

        result = Wunderground.connection.get(path)
        parsed_result = JSON.parse(result.body)

        if parsed_result and parsed_result["moon_phase"]
          new.merge(parsed_result["moon_phase"])
        end
      end
    end
  end

end
