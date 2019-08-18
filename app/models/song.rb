class Song < ApplicationRecord

    validates :title, presence: true
    validates :title, uniqueness: {scope: %i[release_year artist_name]}
    validates :released, inclusion: [true, false]
    with_options if: :release? do |song|
        song.validates :release_year, presence: true, if: :release?
        song.validates :release_year, numericality: {less_than_or_equal_to: ->(song) {Date.current.year}}
    end

    validates :artist_name, presence: true

    def norepeat
        if Song.all.include?(:title)
            :artist_name == @song.artist_name
            :release_year == @song.release_year
        end
    end

    def release?
        released == true
    end

end
