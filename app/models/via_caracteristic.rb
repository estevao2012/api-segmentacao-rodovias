class ViaCaracteristic < ActiveRecord::Base
	
	belongs_to :rodovia
	belongs_to :via_caracteristic_category

	attr_accessor :coord_y, :coord_x

	before_save :generate_geom

	def generate_geom
		self.geom = RGeo::Geographic.spherical_factory(:srid => 4326).point(self.coord_x,self.coord_y)
	end

end
