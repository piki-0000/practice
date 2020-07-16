class CeatePostHashtag < ActiveRecord::Migration[5.1]
  def change
    create_table :post_hashtags do |t|
      t.references :post, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
    end
  end
end
