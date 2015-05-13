class ChangeTable < ActiveRecord::Migration
  def change
    change_table(:trainers) { |t| t.timestamps }
  end
end
