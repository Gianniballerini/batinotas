class LongTask < Task
	validates :percentage, presence: true, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0,  }
	validates :state,  presence: true,  inclusion: { in: %w(pending on_it done), message: "%{value} is not a valid value" }
end
