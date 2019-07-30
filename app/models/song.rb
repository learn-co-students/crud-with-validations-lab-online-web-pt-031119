class Song < ApplicationRecord
    validates :title, presence: true

    validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Song title cannot be repeated by the same artist in the same year." }

    validates :released, inclusion: { in: [true, false] }            
        with_options if: :released do |song|
            song.validates :release_year, presence: true
            song.validates :release_year, numericality: { less_than_or_equal_to: Date.current.year } 
        end
    
    #validates :release_year, presence: true, if: :released, inclusion: { in: [true, false] } == true
    # missing Optional if released is false?
    
    #validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }  
    # missing validation - Must be less than or equal to the current year

    validates :artist_name, presence: true 
end

# validates :year, 
#   numericality: { greater_than: 1960, less_than_or_equal_to: -> { Date.current.year } }

# class User < ApplicationRecord
#     with_options if: :is_admin? do |admin|
#       admin.validates :password, length: { minimum: 10 }
#       admin.validates :email, presence: true
#     end
#   end