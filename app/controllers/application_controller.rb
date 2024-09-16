class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_workspaces
  before_action :set_locale

  private

  def set_workspaces
    @workspaces = current_user.workspaces if user_signed_in?
  end

  def set_locale
    I18n.locale = :en
  end
end
