class ChangeColumnNames < ActiveRecord::Migration
  def change
	rename_column 'piggybak_states', :name, :namex
	rename_column 'piggybak_states', :abbr, :name
	rename_column 'piggybak_states', :namex, :abbr
  end
end
