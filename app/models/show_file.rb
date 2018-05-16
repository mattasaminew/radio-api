class ShowFile < ApplicationRecord
	self.table_name = "cc_files"

	scope :select_from_show_name, ->(show_name) { where(file_exists: true, hidden: false, artist_name: show_name) }

	def file_path
		"#{ENV['AIRTIME_FILE_ROOT']}/#{self.filepath}"
	end
end
