module ApplicationHelper
	def links(nombre, ruta)
		if current_page?(ruta)
			link_to(nombre, ruta, class:"active")
		else
			link_to(nombre, ruta)
		end 
	end

end
