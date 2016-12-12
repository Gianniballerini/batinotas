class List < ApplicationRecord
	validates :url, uniqueness: true
	validates :name, presence: true
	has_many :tasks, -> { order('priority DESC') }, dependent: :destroy #destruye los task asociados al borrar


  	def to_param
		url
  	end

end
