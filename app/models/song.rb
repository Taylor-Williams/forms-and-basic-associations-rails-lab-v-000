class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  # add associations here
end
