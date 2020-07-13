class postHashtag < ApplicationRecord
    belongs_to :post
    belongs_to :Hashtag
    validates  :post_id, presence: true
    validates  :Hashtag_id,   presence: true
  end