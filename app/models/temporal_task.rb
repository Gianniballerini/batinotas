class TemporalTask < Task
	validates :valid_from,  presence: true
	validates :valid_until,  presence: true
	validate :end_date_after_start_date?


  	def end_date_after_start_date?
  		if valid_until != nil && valid_from
			 if valid_until < valid_from
	 	   		errors.add(:valid_until, "can't be before than the starting date")
	 		end
	 	end
	end
	
end
