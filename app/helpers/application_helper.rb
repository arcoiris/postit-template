module ApplicationHelper
	def fix_url(url)
		url.starts_with?("http://") ? url : "http://#{url}"
	end

	def friendly_datetime(dt)
		dt.localtime.strftime("%m/%d/%Y %l:%M%P %Z")
	end
end
