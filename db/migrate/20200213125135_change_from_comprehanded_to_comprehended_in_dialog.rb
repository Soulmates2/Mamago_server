class ChangeFromComprehandedToComprehendedInDialog < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :dialogs, :comprehanded, :comprehended
    change_column_null :dialogs, :feedback, false
    change_column_default :dialogs, :feedback, from: true, to: false
  end

  def self.down
  end
end