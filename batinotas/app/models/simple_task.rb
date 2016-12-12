class SimpleTask < Task
	validates :state,  presence: true,  inclusion: { in: %w(pending done), message: "%{value} is not a valid value" } 
end
