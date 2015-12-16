module VotoMobile
  class BaseList
    attr_accessor :next_url, :previous_url, :data
    
    def initialize(client, path_segment)
      @client = client
      @path_segment = path_segment
    end
    
    def list
      data
    end
    
    def next
      @client.send(@path_segment, @next_url)
    end
    
    def previous
      @client.send(@path_segment, @previous_url)
    end
  end
end
