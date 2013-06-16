class AddSystemToUser < ActiveRecord::Migration
  def change
    add_column :users, :unit_system, :string, default: 'metric'
  end
end
