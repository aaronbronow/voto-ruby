module VotoMobile
  class BaseList
    ENTITY = nil
    attr_accessor :next_url, :previous_url, :status

    def initialize(client, path_segment)
      @client = client
      @path_segment = path_segment
    end

    def assign_data(list)
      if self.class::ENTITY.nil?
        @data = list
        return
      end
      data = []
      list.each { |hash| data << self.class::ENTITY.new(hash, @client) }
      @data = data
    end

    def list
      data
    end

    def next
      return false if @next_url.nil?
      @client.send(@path_segment, @next_url)
    end

    def previous
      return false if @previous_url.nil?
      @client.send(@path_segment, @previous_url)
    end

    private

    attr_accessor :data
  end
end
