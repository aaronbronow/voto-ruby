module VotoMobile
  class BaseList
    attr_accessor :next_url, :previous_url, :status, :data
    
    def initialize(client, path_segment)
      @client = client
      @path_segment = path_segment
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
  end
end
