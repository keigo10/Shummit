class Admins::EventsController < ApplicationController

  def index
    @events=Event.all
  end

  def show
    @event=Event.find(params[:id])
    @bulletin_board = BulletinBoard.new
  end

  def edit
    # binding.pry
    @event=Event.find(params[:id])
  end

  def update
    event=Event.find(params[:id])
    event.update(event_params)
    redirect_to admins_event_path(event.id)
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_id, :user_id, :genre_id, :events_name, :entrance_fee, :sports, :persons, :event_image_id, :event_status, :description, :holding, :postcode, :prefecture_code, :address_city, :address_street, :address_building)
    end
end

