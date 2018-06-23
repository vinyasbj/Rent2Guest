class RenameColumnLatAndLogToFloat < ActiveRecord::Migration[5.1]
  def change
  	change_column :rooms ,:latitude,:float
  	change_column :rooms ,:longitude,:float
  end
end
