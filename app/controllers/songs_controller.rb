class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
  def index
    @songs = Song.all
  end

  def show
  end
  
  def new
    @song = Song.new 
  end 
  
  def edit 
  end 
  
  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new 
    end
  end

  def update 
    set_song 
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit 
    end
  end

  def destroy 
    set_song 
    @song.destroy 
    redirect_to songs_url
  end
  private

  def set_song 
    @song = Song.find(params[:id])
  end

  def song_params 
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
end
