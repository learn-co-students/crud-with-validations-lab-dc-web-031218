class Song < ActiveRecord::Base
  validates :title, presence: true
  #title cannot be repeated by the same artist in the same year
  validates :released, inclusion: { in: [true, false]}
  #release_year  optional if released is false
  #release_year  must not be blank if released is true
  #release_year  must be less than or equal to the current year
  # validates :artist_name, presence: true

end
