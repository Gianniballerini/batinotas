class LongTask < Task
	validates :percentage, presence: true, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0,  }

end
