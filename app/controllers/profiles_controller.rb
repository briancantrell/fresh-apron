class ProfilesController < ApplicationController
  before_action :load_profile

  def edit
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to edit_user_profile_path(current_user), info: "Successfully updated profile"
    else
      flash.alert = "didn't save"
      render :edit
    end
  end

  private

  def profile_params
    params
      .require(:profile)
      .permit(:shopping_day, meal_days: [])
  end

  def load_profile
    @profile = Profile.find_or_create_by(user: current_user)
  end
end

