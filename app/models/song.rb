class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def artist=(song_artist_name)
    self.artist = Artist.find_or_create_by(song_artist_name)
  end

  def genre_id=(song_genre_id)
    self.genre = Genre.find(song_genre_id)
  end

  def note_contents=(song_notes)
    song_notes.each do |note|
      if note != ""
        self.notes << note
      end
    end
  end
end
