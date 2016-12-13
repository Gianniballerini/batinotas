class TemporalTask < Task
	validates :valid_from,  presence: true
	validates :valid_until,  presence: true

  	# before_validation(on: :create) do
  	# 	if (self.valid_until < self.valid_from )
  	# 		:abort
  	# 	end
  	# end

	before_save do
		if (self.valid_until < DateTime.now)
			self.state = "expired"
		end
  	end

  	
end
