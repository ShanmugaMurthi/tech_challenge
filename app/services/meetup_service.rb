class MeetupService
  include HTTParty
  base_uri ENV['BASE_URL']
  def initialize        
    @options = {query: {key: ENV['API_KEY'] }}
  end

  def get_group_data(search_query)
    @options[:query].merge!({lat: 48.14, lon: 11.58, page: 10, text: search_query})
    response = self.class.get('/find/groups',@options)
    expected_response(response)
  end

  def get_past_events(url_name)
    @options[:query].merge!({ status: "past", desc: true, page: 3})
  	self.class.get("/#{url_name}/events",@options)
  end

  def get_future_events(url_name)
    @options[:query].merge! ({status: "upcoming", page: 3})
    self.class.get("/#{url_name}/events",@options)
  end

  def expected_response(response)
    if response.code.to_i == 200
      response.parsed_response
    else
      raise "Error fetching data from Meetup API"
    end
  end
end
