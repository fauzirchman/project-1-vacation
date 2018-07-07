class ProfilesController < ApplicationController

  def update
  	@profile = Profile.find(params[:id])
  	@profile.update_attributes profile_params

  	redirect_to settings_path
  end

  private

  def profile_params
  	params.require(:profile).permit(:first_name, :last_name, :birthday, :gender, :address, :phone, :location)
  end

end
