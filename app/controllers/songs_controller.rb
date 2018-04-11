class SongsController < ApplicationController
before_action :set_song, only: [:show,:edit,:update,:destroy]


  def index
    @songs = Song.all
  end
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(form_params)
    if @song.valid?
      @song = Song.create(form_params)
      redirect_to song_path(@song)
    else
      render :new
    end

  end

  def update
    @song.update(form_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def form_params
    params.require(:song).permit(Song.column_names)
  end

end
