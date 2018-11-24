class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  def artist_name=(song_artist_name)
    @song.artist = Artist.find_or_create_by(song_artist_name)
  end

  def genre_id=(song_genre_id)
    @song.genre = Genre.find(song_genre_id)
  end

  def note_contents=(song_notes)
    song_notes.each do |note|
      if note != ""
        @song.notes << note
      end
    end
  end
  
  private

  def song_params
    params.require(:song).permit(:title, :artist, :genre_id, note_contents: [])
  end
end

