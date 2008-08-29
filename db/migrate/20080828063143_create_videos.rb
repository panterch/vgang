class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :customer_id
      t.string :title
      t.string :key

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
