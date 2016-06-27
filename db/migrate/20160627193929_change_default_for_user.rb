class ChangeDefaultForUser < ActiveRecord::Migration
  def change
    change_table :ideas do |t|
      t.remove :quality
      t.integer :quality, default: 0
    end
  end
end
