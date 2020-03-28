# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  before_action :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    if params[:id]
      @events = Event.where(genre_id: params[:id].to_i)
      @genre = Genre.find(params[:id])
    else
      @search = Event.ransack(params[:q])
      @events = @search.result
    end
    @genres = Genre.all
  end

  def genre
    @genres = Genre.where(is_valid: true )
  end

  def main
    @events = Event.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @user = User.find(current_user.id)
    @bulletin_board = BulletinBoard.new
  end

  def gloup
    @event = Event.find(params[:id])
    @user = User.find(current_user.id)
    @bulletin_board = BulletinBoard.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  def search
    @search = Event.ransack(params[:q])
    @events = @search.result
  end

  # POST /events
  # POST /events.json
  def create
    user = User.find(current_user.id)
    @event = user.events.new(event_params)
    respond_to do |format|
      if @event.save
        @join_event = user.join_events.create(event_id: @event.id)
        format.html { redirect_to @event, notice: 'イベントを新しく立ち上げました。' }
        format.json { render :show, status: :created, location: @event }
      else
        # format.html { redirect_back(fallback_location: new_event_path)}
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'イベント情報を更新しました。' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_main_path, notice: 'イベントを消去しました。' }
      format.json { head :no_content }
    end
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
