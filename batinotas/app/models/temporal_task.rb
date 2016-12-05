class TemporalTask < Task
	validates :state,  presence: true,  inclusion: { in: %w(pending done expired), message: "%{value} is not a valid value" }

	validates :valid_from,  presence: true
	validates :valid_until,  presence: true

end
