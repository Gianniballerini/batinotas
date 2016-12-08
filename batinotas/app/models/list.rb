class List < ApplicationRecord
	validates :url, uniqueness: true, presence: true
	validates :name, presence: true
	has_many :tasks, dependent: :destroy #destruye los task asociados 


	before_validation(on: :create) do
    	self.url = self.name.parameterize
  	end

  	def to_param
		url
  	end

end
