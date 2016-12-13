class List < ApplicationRecord
	validates :url, uniqueness: true
	validates :name, presence: true
	has_many :tasks, -> { order('priority DESC') }, dependent: :destroy #destruye los task asociados al borrar

	before_validation(on: :create) do
		if self.name != nil
	    	self.url = self.name.parameterize
	    	if self.url == ""
	    		self.url = "you-gave-me-no-choice-now-try-remembering-this-#{SecureRandom.hex[0,10].downcase}"
	    	end
	    end
  	end

  	def to_param
		url
  	end

end
