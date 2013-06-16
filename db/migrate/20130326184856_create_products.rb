class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :manufacturer
      t.boolean :is_verified, default: false
    end

  end
end
