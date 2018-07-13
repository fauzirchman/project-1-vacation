class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  scope :requested, -> { where(approved: nil) }
  scope :rejected, -> { where(approved: false) }

  def self.check(user_id, friend_id)
    where(user_id: user_id, friend_id: friend_id).present? && where(user_id: friend_id, friend_id: user_id).present?
  end

  def self.add(friend_id)
    create friend_id: friend_id
  end

  def remove
    Friendship.where(user_id: user_id, friend_id: friend_id).destroy_all
    Friendship.where(user_id: friend_id, friend_id: user_id).destroy_all
  end

  def create_for_friend
    Friendship.create user_id: friend_id, friend_id: user_id, approved:true unless Friendship.check user_id, friend_id
  end

  def approve!
    create_for_friend if update_attribute :approved, true
  end

  def reject!
    update_attribute :approved, false
  end
end
