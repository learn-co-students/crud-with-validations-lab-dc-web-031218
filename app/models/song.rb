class Song < ActiveRecord::Base
	validates :title, presence: :true
	# validates :released, presence: true
	validates :released, inclusion: { in: [ true, false ] }
	validate :title, :repeat_same_year
	validate :release_year, :custom_release_year
	validate :release_year, :release_in_future

	def repeat_same_year
		if Song.all.any?{|s| s.title == self.title && 
						s.release_year == self.release_year &&
						s.artist_name == self.artist_name}
			errors.add(:title, "Cannot have same song in same year by same artist")
		end
	end

	def custom_release_year
		#released but no year
		if self.released && self.release_year == nil
			errors.add(:release_year, "Must have release year if released is true")
		end 	
	end

	def release_in_future
		#released, but improper year
		if self.released && self.release_year != nil
			if self.release_year > Time.current.year
				errors.add(:release_year, "Release year must <= Time.current.year")
			end
		end
		
	end

end
