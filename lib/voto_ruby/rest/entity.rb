module VotoMobile
  class Entity
    def initialize(attributes = {}, client = nil)
      @client = client
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        rescue NoMethodError
          puts "voto-ruby: missing field '#{name}' for #{self.class.name}"
        end
      end
    end
  end
end
