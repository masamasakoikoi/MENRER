class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  #フォローした、されたの関係
  has_many :user_relationships, class_name: "UserRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_user_relationships, class_name: "UserRelationship", foreign_key: "following_id", dependent: :destroy
  
  #一覧画面で使う
  has_many :followings, through: :user_relationships, source: :following
  has_many :followers, through: :reverse_of_user_relationships, source: :follower
  
  #フォローした時の処理
  def follow(user_id)
    user_relationships.create(following_id: user_id)
  end
  
  #フォローを外す時の処理
  def unfollow(user_id)
    user_relationships.find_by(following_id: user_id).destroy
  end
  
  #フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
end
