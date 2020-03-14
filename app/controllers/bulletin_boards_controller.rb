# frozen_string_literal: true

class BulletinBoardsController < ApplicationController
  def destroy
    @bulletin_board = current_user.bulletin_boards.find_by(id: params[:id])
    event = @bulletin_board.event
    @bulletin_board.destroy
    respond_to do |format|
      format.js { render :destroy, locals: { @bulletin_board => @bulletin_board } }
    end
      # @redirect_back(fallback_location: root_path)
    end

  def create
    event = Event.find(params[:event_id])
    @bulletin_board = current_user.bulletin_boards.new(bulletin_board_params)
    @bulletin_board.event_id = event.id
    @bulletin_board.save
    respond_to do |format|
      format.js { render :create, locals: { @bulletin_board => @bulletin_board, @event => event } }
    end
      # redirect_back(fallback_location: root_path)
    end

  private

  def bulletin_board_params
    params.require(:bulletin_board).permit(:user_id, :event_id, :comment)
  end
end
