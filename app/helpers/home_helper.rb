module HomeHelper
	def random_color
		"%06x" % (rand * 0xffffff)
	end

	def height_based_extension_rod ext_rod, ext_seg
		(100 * ext_seg) / ext_rod
	end
end
