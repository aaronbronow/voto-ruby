module VotoMobile
  class Entity
    def initialize(attributes = {}, client = nil)
      @client = client
      attributes.each do |name, value|
        begin
          send("#{safe_name(name)}=", value)
        rescue NoMethodError
          puts "voto-ruby: missing field '#{name}' for #{self.class.name}"
        end
      end
    end

    private

    def safe_name(name)
      name == 'class' ? 'klass' : name
    end
  end
end
