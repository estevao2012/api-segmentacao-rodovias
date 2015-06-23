class ViaCaracteristic < ActiveRecord::Base
	
	belongs_to :rodovia
	belongs_to :via_caracteristic_category

	attr_accessor :coord_y, :coord_x

	def generate_geom
		if self.coord_x && self.coord_y
			self.geom = RGeo::Geographic.spherical_factory(:srid => 4326).point(self.coord_x,self.coord_y)
			sql = "SELECT ST_AsText(ST_ClosestPoint(
						    ST_GeomFromText('#{self.rodovia.geom}'),
						    ST_GeomFromText('#{self.geom}')
						));"
			result = ActiveRecord::Base.connection.execute(sql)
			result.each do |row|
				self.geom = row["st_astext"]
			end

			sql = "SELECT ST_line_locate_point(
						    ST_LineMerge(ST_GeomFromText('#{self.rodovia.geom}')),
						    ST_GeomFromText('#{self.geom}')
						);"
			result = ActiveRecord::Base.connection.execute(sql)
			result.each do |row|
				self.distance = row["st_line_locate_point"]
			end
			
		end

	end

end
