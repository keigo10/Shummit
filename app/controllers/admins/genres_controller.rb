# frozen_string_literal: true

class Admins::GenresController < ApplicationController
  before_action :set_genre, only: %i[show edit update destroy]

  # GET /genres
  # GET /genres.json
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  # GET /genres/new
  def new
    @genre = Genre.new
    @genres = Genre.where(is_valid: true)
  end

  # GET /genres/1/edit
  def edit
    @genre = Genre.find(params[:id])
  end

  # POST /genres
  # POST /genres.json
  def create
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to admins_genres_path, notice: 'Genre was successfully created.' }
        format.json { render :show, status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    genre=Genre.find(params[:id])
    if params[:genre][:is_vaild] == true
      genre.is_valid = true
      genre.update(genre_params)
      redirect_to admins_genres_path
     else
      genre.is_valid = false
      genre.update(genre_params)
      redirect_to admins_genres_path
     end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_genre
    @genre = Genre.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def genre_params
    params.require(:genre).permit(:genre_name, :is_valid, :genre_image)
  end
end
