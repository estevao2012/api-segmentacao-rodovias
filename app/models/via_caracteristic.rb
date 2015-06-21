class ViaCaracteristic < ActiveRecord::Base
	
	belongs_to :rodovia
	belongs_to :via_caracteristic_categorys

end
