require 'httparty'

class FeedService
  def initialize; end
  
  def get_events
    HTTParty.get(
      "https://calendly.com/api/v2/users/me/events",
      headers: headers
    )
  end

  private

  def headers
    {
      "X-Token": "KONMLKHMLN25PSSYXXEW6NN3O37NHVRC"
    }
  end
end