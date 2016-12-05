class Task < ApplicationRecord
	
  	validates :description,  presence: true, length: { maximum: 255 }

	validates :priority,  presence: true

	validates :state,  presence: true

	belongs_to :list
end
