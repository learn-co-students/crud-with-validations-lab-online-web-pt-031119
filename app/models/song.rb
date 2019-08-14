class Song < ApplicationRecord
  validates :title, presence: true
  validate :cannot_be_repeated, :released_without_release_year, :release_year_in_the_future
  
  def cannot_be_repeated
    songs = Song.all
    songs.each do |s|
      if s.title == self.title && s.artist_name == self.artist_name && s.release_year == self.release_year
        errors.add(:title, "this song already exits")
      end
    end
  end
  
  def released_without_release_year
    if self.released && self.release_year == nil
      errors.add(:released, "release year cannot be blank")
    end
  end
  
  def release_year_in_the_future
    if self.release_year && self.release_year > Time.now.year.to_i
      errors.add(:release_year, "release year cannot be in the future")
    end
  end
  
  
end
