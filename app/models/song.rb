class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  # validates_inclusion_of :released, in: [true,false]

  with_options if: :released? do |bool|
    bool.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year},
                                  presence: true, uniqueness: true
    end
  with_options if: :unreleased? do |bool|
    bool.validates :release_year, absence: true
    end



  def released?
    released
  end
  def unreleased?
    !released
  end

end

# release_year, an integer
#   Optional if released is false
#   Must not be blank if released is true
#   Must be less than or equal to the current year
