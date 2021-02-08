class MeetupsController < ApplicationController
  before_action :meetup_service, only:[:events]
  def index
  	results = $redis.get(params["search_query"])
  	if !params["search_query"].blank? && results.nil?
  	  results = get_meetup_groups(params["search_query"])
  	  $redis.set(params["search_query"], results)      
  	end
    @search_results = json_response(results)    
  end

  def events
    @events = get_recent_events(params[:url_name])
    @future_events = get_upcoming_events(params[:url_name])
    render layout: false
  end

  private
  def json_response(results)
    # I find it odd that we have to do this. Is there a more optimal way
    # where you could avoid doing this check for a string and +gsub+'ing?
    results.is_a?(String)? JSON.parse(results.gsub('=>',':')): results
  end

  def get_recent_events(url_name)
    @meetup_service.get_past_events(url_name)
  end

  def get_upcoming_events(url_name)
    @meetup_service.get_future_events(url_name)
  end

  def get_meetup_groups(search_query)
    meetup_service.get_group_data(search_query)
  end

  def meetup_service
    # So a new instance is created for every request.
    # Do we need a new instance for every request? As far as I see, its not
    # request dependant. Could this be done in a more efficient way?
    @meetup_service ||= MeetupService.new
  end
end
