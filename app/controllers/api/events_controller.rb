class API::EventsController < ApplicationController
  before_action :set_event, only: :show
  skip_before_action :verify_authenticity_token

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    render json: @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render json: @event
  end

  # POST /events
  # POST /events.json
  def create
    Event.create(payload: params)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event, :time, :payload)
    end
end
