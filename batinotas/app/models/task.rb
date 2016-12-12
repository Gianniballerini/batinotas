class Task < ApplicationRecord
	
  	validates :description,  presence: true, length: { maximum: 255 }

	validates :priority,  presence: true

	validates :state,  presence: true

	belongs_to :list
	

	scope :long, ->{ where(type: 'LongTask') }
	scope :temporal, ->{ where(type: 'TemporalTask') }
	scope :valid, ->(time) { where("valid_from <= ? AND valid_until >= ?",time,time) }
	scope :simple, ->{ where(type: 'SimpleTask') }


    #En base a ejemplos sacados de la documentacion de active record:
        #Client.where("created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]})
        #Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)  
end
