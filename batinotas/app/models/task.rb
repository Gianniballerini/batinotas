class Task < ApplicationRecord
	
  	validates :description,  presence: true, length: { maximum: 255 }

	validates :priority,  presence: true

	validates :state,  presence: true

	belongs_to :list
	

	scope :long, ->{ where(type: 'LongTask') }
	scope :temporal, ->{ where(type: 'TemporalTask') }
	scope :simple, ->{ where(type: 'SimpleTask') }
end
