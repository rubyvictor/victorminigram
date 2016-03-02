module ApplicationHelper


#app/helpers/application_helper.rb		
	def country_name(country_code)
			country = ISO3166::Country[country_code]
			if country
				country.translations[I18n.locale.to_s]
			else
				country_code		
			end	
		end
	end
