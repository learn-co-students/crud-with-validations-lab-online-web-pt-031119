class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, uniqueness: true
  validate :need_release_year
  validate :past_release_year

  private
  def need_release_year
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "released song must have a year")
    end
  end

  def past_release_year
    if self.release_year != nil && self.release_year > 2019
      errors.add(:release_year, "must be released in the past")
    end
  end

end
