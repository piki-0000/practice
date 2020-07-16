class Deleterecord < ActiveRecord::Migration[5.1]
  def change
    drop_table :post_hashtags
  end
end
