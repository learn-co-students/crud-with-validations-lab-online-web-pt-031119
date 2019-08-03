class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, numericality: { less_than_or_equal_to: 2019 }, if: :released?
    validates :release_year, presence:false, if: :not_released?
    validates :artist_name, presence: true

    def released?
        self.released == true
    end
    
    def not_released?
        self.released == false
    end
end
