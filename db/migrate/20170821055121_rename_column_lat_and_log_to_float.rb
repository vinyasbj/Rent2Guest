class RenameColumnLatAndLogToFloat < ActiveRecord::Migration
  def change
  	change_column :rooms ,:latitude,:float
  	change_column :rooms ,:longitude,:float
  end
end
