class BulletinBoardsController < ApplicationController

	def destroy
		event = Event.find(params[:event_id])
	    comment = current_user.bulletin_boards.find(params[:id])
	    comment.destroy
	    redirect_back(fallback_location: root_path)
    end

	def create
	    event = Event.find(params[:event_id])
	    comment = current_user.bulletin_boards.new(bulletin_board_params)
	    comment.event_id = event.id
	    comment.save
	    redirect_back(fallback_location: root_path)
    end

    private

	def bulletin_board_params
	  params.require(:bulletin_board).permit(:user_id,:event_id,:comment)
	end

end
