class Song < ApplicationRecord

    validates :title, presence: true
    validate :norepeat
    validates :released, inclusion: [true, false]
    validate :release
    validates :artist_name, presence: true

    def norepeat
        if Song.all.include?(:title)
            :artist_name == @song.artist_name
            :release_year == @song.release_year
        end
    end

    def release
        if :released
            :release_year == true
        end
    end


end
