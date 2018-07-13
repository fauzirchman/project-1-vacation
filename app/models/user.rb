class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :friendships
  has_many :friends, -> { where(friendships: {approved: true}) }, :through => :friendships

  after_create :create_user_profile

  def has_profile?
  	profile.present?
  end

  def name
  	return email unless profile.first_name and profile.last_name
  	profile.first_name + " " + profile.last_name
  end

  def friend_requests
    Friendship.where(friend_id: id, approved: nil)
  end

  def unfriend(friend_id)
    Friendship.find_by(user_id: id, friend_id: friend_id).remove
  end

  private

  def create_user_profile
  	create_profile user_id: id unless has_profile?
  	update_attribute :profile_id, profile.id
  end
end
