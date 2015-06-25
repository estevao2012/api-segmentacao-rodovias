class ViaCaracteristic < ActiveRecord::Base
	
	belongs_to :rodovia
	belongs_to :via_caracteristic_category, class_name: "ViaCaracteristicCategory",
                        									foreign_key: "via_caracteristic_categorys_id"

	attr_accessor :coord_y, :coord_x

	def generate_geom
		if self.coord_x && self.coord_y

			self.geom = RGeo::Geographic.spherical_factory(:srid => 4326).point(self.coord_x,self.coord_y)
			
			sql 			= "SELECT ST_AsText(ST_ClosestPoint(
									    ST_GeomFromText('#{self.rodovia.geom}'),
									    ST_GeomFromText('#{self.geom}')
									));"

			result 		= ActiveRecord::Base.connection.execute(sql)
			row 		  = result.first
			self.geom = row["st_astext"]

			sql 					= "SELECT ST_line_locate_point(
									    ST_LineMerge(ST_GeomFromText('#{self.rodovia.geom}')),
									    ST_GeomFromText('#{self.geom}')
											);"
			result  			= ActiveRecord::Base.connection.execute(sql)
			row 					= result.first
		  self.distance = row["st_line_locate_point"]

			sql 		= "SELECT ST_Length(cast(ST_GeomFromText('#{self.rodovia.geom}') as geography))/1000 AS km_roads;"
			result  = ActiveRecord::Base.connection.execute(sql)

			row 		= result.first
			self.km = (row["km_roads"].to_f * self.distance.to_f)
		end
	end

end
