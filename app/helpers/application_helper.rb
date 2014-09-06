module ApplicationHelper
	def fix_url(url)
		url.starts_with?("http://") ? url : "http://#{url}"
	end

	def friendly_datetime(dt)
		if logged_in? && !current_user.time_zone.blank?
			dt = dt.in_time_zone(current_user.time_zone)
		end
		dt.strftime("%m/%d/%Y %l:%M%P %Z")
	end
end
