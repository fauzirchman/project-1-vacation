class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  after_create :create_user_profile

  def has_profile?
  	profile.present?
  end

  def name
  	return email unless profile.first_name and profile.last_name
  	profile.first_name + " " + profile.last_name
  end

  private

  def create_user_profile
  	create_profile user_id: id unless has_profile?
  	update_attribute :profile_id, profile.id
  end
end
