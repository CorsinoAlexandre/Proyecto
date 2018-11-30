class Auction < ApplicationRecord
	belongs_to :residence
	has_and_belongs_to_many :users
	belongs_to :user
	belongs_to :availability

 #FONCTION SQL PARA ENCONTRAR UNA FECHA ENTRE DOS FECHAS
	scope :open, -> { where("? BETWEEN dateStart AND dateEnd", Date.today)}
	scope :closed, -> { where("? NOT BETWEEN dateStart AND dateEnd", Date.today)}

	def isActive()
		if Date.today > self.dateStart && Date.today < self.dateEnd
			return true
		else
			return false
		end
	end

end
