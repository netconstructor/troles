class CreateStringMany < ActiveRecord::Migration
  def self.up
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :troles
      t.timestamps
    end
  end
  
  def self.down  
    drop_table :users
  end
end

