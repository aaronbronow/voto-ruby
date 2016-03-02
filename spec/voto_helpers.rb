module VotoHelpers

  def stub_voto_request(url, filename)
    response = read(filename)
    url = voto_url(url)
    stub_request(:get, url).to_return(:body => response)
  end

  private

  def voto_url(url)
    "https://go.votomobile.org/api/v1/#{url}"
  end

  def read(filename)
    path = File.join(File.dirname(__FILE__), "/files/#{filename}.json")
    File.read path
  end
end
