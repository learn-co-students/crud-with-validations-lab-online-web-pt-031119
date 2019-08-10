class Song < ApplicationRecord

#song must contain a title 
validates :title presence: true

#title of song must be unque per year
validates :title uniquness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same artist in the same year'}
    
    # song released? boolean 
     validates :released, inclusion: { in: [true, false] }
     
     with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
     
     
     #artist must have name 
  validates :artist_name, presence: true
  
  validates :genre presence: true
  
  
end
