class ProfilesController < ApplicationController
  def show
    @current_user
  end

  def update
    if @current_user.update(user_params)
      flash[:notice] = t('profiles.update.success')
      redirect_to profile_path
    else
      flash[:alert] = t('profiles.update.failure')
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :number, :username) 
  end
end
