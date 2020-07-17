class Post < ApplicationRecord
    belongs_to :user
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    has_many :post_hashtags
    has_many :hashtags, through: :post_hashtags
    
    
    def user
      return User.find_by(id: self.user_id)
    end
    
    #DBへのコミット直前に実施する
  after_create do
    post = post.find_by(id: self.id)
    hashtags  = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      hashtag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << hashtag
    end
  end

  before_update do 
    post = post.find_by(id: self.id)
    # post.hashtags.clear
    hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      hashtag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << hashtag
    end
  end

  end