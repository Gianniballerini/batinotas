class List < ApplicationRecord
	validates :url, uniqueness: true
	has_many :tasks


	before_validation(on: :create) do
    	self.url = self.name.parameterize
  	end
end
