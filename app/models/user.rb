class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.first_name = "太郎"
      user.last_name_kana = "ゲスト"
      user.first_name_kana = "タロウ"
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  #フォローした、されたの関係
  has_many :user_relationships, class_name: "UserRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_user_relationships, class_name: "UserRelationship", foreign_key: "following_id", dependent: :destroy
  
  #一覧画面で使う
  has_many :followings, through: :user_relationships, source: :following
  has_many :followers, through: :reverse_of_user_relationships, source: :follower
  
  validates :last_name, presence: true, length:{ in:1..20}
  validates :first_name, presence: true, length:{ in:1..20}
  validates :last_name_kana, presence: true, length:{ in:1..20}
  validates :first_name_kana, presence: true, length:{ in:1..20}
  
  
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
  
  #ransack検索許可
  def self.ransackable_attributes(auth_object = nil)
    ["admin", "created_at", "email", "encrypted_password", "first_name", "first_name_kana", "id", "is_deleted", "last_name", "last_name_kana", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["comments", "favorites", "followers", "followings", "posts", "reverse_of_user_relationships", "user_relationships"]
  end
end
