class Show < ApplicationRecord
	self.table_name = "cc_show"

	def self.deduped_shows
		find_by_sql(arel_table.project(arel_table[Arel.star])
													.distinct_on(arel_table[:name])
													.order(arel_table[:name], arel_table[:id].desc))
	end
end
