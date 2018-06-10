class Show < ApplicationRecord
	self.table_name = "cc_show"

	def self.deduped_shows
		find_by_sql(arel_table.project(arel_table[Arel.star])
													.distinct_on(arel_table[:name])
													.order(arel_table[:name], arel_table[:id].desc))
	end

	def self.slug_show_names
		deduped_shows.pluck(:id, :name).map do |show|
			{
				id: show.first,
				slug_name: show.last.downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9-]/, '')
			}
		end
	end
end
