class JoinEventsController < ApplicationController

  def index
    @join_event = JoinEvent.find(params[:id])
    @event = @join_event.event
    @user = @join_event.user
  end

  def show
    @join_event = JoinEvent.find(params[:id])
    @event = @join_event.event
    @user = @join_event.user
  end

  def create
  	@join_event = JoinEvent.new(join_event_params)
    if @join_event.save
      redirect_to request.referer, notice: 'グループ参加しました。'
    else
      render :new
    end
  end

  private
  def join_event_params
    params.require(:join_event).permit(:event_id, :user_id )
  end

end
