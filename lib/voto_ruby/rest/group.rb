module VotoMobile
  module REST
    class Group
      def list(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        
      end

      def new(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}

      end
    end
  end
end