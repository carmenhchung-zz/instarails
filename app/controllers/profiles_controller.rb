class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def show
    redirect_to edit_profile_url if @profile.nil?
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
      else
        format.html { redirect_to edit_profile_path, notice: 'Could not update profile.' }
      end
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_path, notice: 'Profile was successfully created.' }
      else
        format.html { redirect_to edit_profile_path, notice: 'Could not save profile.' }
      end
    end
  end

  def edit
    @profile = Profile.new(user: current_user) if @profile.nil?
  end

  def destroy
  end

  private

  def set_profile
    if params[:id]
      @profile = Profile.find_by!(user_id: params[:id])
    else
      @profile = Profile.find_by(user: current_user)
    end
  end

  def profile_params
    params.require(:profile).permit(:avatar_data, :username, :firstname, :lastname, :bio)
  end
end
