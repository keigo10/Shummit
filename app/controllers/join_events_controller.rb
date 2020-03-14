# frozen_string_literal: true

class JoinEventsController < ApplicationController
  def create
    @join_event = JoinEvent.new(user_id: current_user.id, event_id: params[:event_id])
    if @join_event.save
      redirect_to request.referer, notice: 'グループ参加しました。'
    else
      render :new
    end
  end

  def destroy
    @join_event = JoinEvent.find_by(user_id: current_user.id, event_id: params[:event_id])
    @join_event.destroy
    respond_to do |format|
      format.html { redirect_to events_main_path, notice: 'イベントを抜けました。' }
      format.json { head :no_content }
    end
  end

  private

  def join_event_params
    params.require(:join_event).permit(:event_id, :user_id)
  end
end
