class Task < ApplicationRecord
	
  	validates :description,  presence: true, length: { maximum: 255 }

	validates :priority,  presence: true, numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 1  }

	validates :state,  presence: true,  inclusion: { in: %w(pending on_it done), message: "%{value} is not a valid value" }

	belongs_to :list, :touch => true
	

	scope :long, ->{ where(type: 'LongTask') }
	scope :temporal, ->{ where(type: 'TemporalTask') }
	scope :valid, ->(time) { where("valid_from <= ? AND valid_until >= ?",time,time) }
	scope :simple, ->{ where(type: 'SimpleTask') }




    #En base a ejemplos sacados de la documentacion de active record:
        #Client.where("created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]})
        #Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)  

    def <=>(another_task)
  		self.priority<=>another_task.priority
	end
end
