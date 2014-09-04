module Sluggable
	extend ActiveSupport::Concern
		
	included do
		before_save :generate_slug
		class_attribute :slug_column
	end


	def to_param
		self.slug
	end

	def generate_slug
		slug_str = to_slug(self.send(self.class.slug_column.to_sym))
		sluggable_obj = self.class.find_by slug: slug_str
		count = 2
		while sluggable_obj && sluggable_obj != self
			slug_str = append_suffix(slug_str, count)
			sluggable_obj = self.class.find_by slug: slug_str
			count += 1
		end
		self.slug = slug_str
	end

	def to_slug(name)
		str = name.strip
		str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
		str.gsub! /-+/, "-"
		str.downcase
	end

	def append_suffix(str, count)
		if str.split('-').last.to_i != 0
			return str.split('-').slice(0...-1).join('-') + '-' + count.to_s
		else
			return str + '-' + count.to_s
		end
	end

	module ClassMethods
		def sluggable_column(col_name)
			self.slug_column = col_name
		end
	end
end